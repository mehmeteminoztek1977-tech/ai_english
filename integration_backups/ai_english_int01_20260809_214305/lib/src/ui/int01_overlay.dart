import 'package:flutter/material.dart';

import '../../gen_l10n/app_localizations.dart';
import '../controller/int01_session_controller.dart';
import '../controller/interaction_state_machine.dart';
import '../model/interaction_spec.dart';
import '../model/locked_lesson_contract.dart';
import 'token_word_card.dart';

class Int01Overlay extends StatelessWidget {
  const Int01Overlay({
    super.key,
    required this.session,
    required this.layoutContract,
    this.onFlowAction,
  });

  final Int01SessionController session;
  final FlutterContractSpec layoutContract;
  final ValueChanged<String>? onFlowAction;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: session,
      builder: (BuildContext context, Widget? child) {
        if (!session.interactionVisible) {
          return const SizedBox.shrink();
        }
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final MediaQueryData media = MediaQuery.of(context);
            final double contractTop = constraints.maxHeight *
                layoutContract.safeTopPx /
                layoutContract.designHeight;
            final double contractBottom = constraints.maxHeight *
                layoutContract.safeBottomPx /
                layoutContract.designHeight;
            return ColoredBox(
              color: Colors.black.withOpacity(0.48),
              child: Padding(
                padding: EdgeInsets.only(
                  top: contractTop > media.padding.top
                      ? contractTop
                      : media.padding.top,
                  bottom: contractBottom > media.padding.bottom
                      ? contractBottom
                      : media.padding.bottom,
                  left: 20,
                  right: 20,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: _PromptCard(
                      session: session,
                      onFlowAction: onFlowAction,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _PromptCard extends StatelessWidget {
  const _PromptCard({
    required this.session,
    this.onFlowAction,
  });

  final Int01SessionController session;
  final ValueChanged<String>? onFlowAction;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final InteractionState state = session.state;
    return Semantics(
      container: true,
      liveRegion: true,
      label: session.spec.accessibility.screenReaderLabel,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        elevation: 12,
        borderRadius: BorderRadius.circular(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  l10n.int01Title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.int01Prompt,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: session.spec.tokens
                      .map(
                        (TokenWord token) => TokenWordCard(
                          key: ValueKey<String>(token.id),
                          token: token,
                          state: _cardState(token.id, state),
                          stateLabel: _stateLabel(
                            l10n,
                            _cardState(token.id, state),
                          ),
                          onTap: state.phase ==
                                  InteractionPhase.awaitingSelection
                              ? () => session.selectToken(token.id)
                              : null,
                        ),
                      )
                      .toList(growable: false),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.int01AttemptsRemaining(session.attemptsRemaining),
                  textAlign: TextAlign.center,
                ),
                if (_feedbackText(l10n, state) case final String feedback) ...[
                  const SizedBox(height: 12),
                  Semantics(
                    liveRegion: true,
                    child: Text(
                      feedback,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: _primaryAction(state),
                  child: Text(_primaryLabel(l10n, state)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  VoidCallback? _primaryAction(InteractionState state) {
    return switch (state.phase) {
      InteractionPhase.awaitingSelection => state.selectedId == null
          ? null
          : session.submitSelection,
      InteractionPhase.incorrectFeedback =>
        session.acknowledgeIncorrectFeedback,
      InteractionPhase.correctFeedback || InteractionPhase.solution => () async {
          final String? action = await session.completeAndResume();
          if (action != null) {
            onFlowAction?.call(action);
          }
        },
      _ => null,
    };
  }

  String _primaryLabel(AppLocalizations l10n, InteractionState state) {
    return switch (state.phase) {
      InteractionPhase.incorrectFeedback => l10n.int01TryAgain,
      InteractionPhase.correctFeedback || InteractionPhase.solution =>
        l10n.int01Continue,
      _ => l10n.int01Submit,
    };
  }

  String? _feedbackText(AppLocalizations l10n, InteractionState state) {
    return switch (state.phase) {
      InteractionPhase.incorrectFeedback
          when state.flowAction == session.spec.validation.onFirstFail =>
        l10n.int01Hint1,
      InteractionPhase.incorrectFeedback => l10n.int01Hint2,
      InteractionPhase.correctFeedback => l10n.int01Correct,
      InteractionPhase.solution => l10n.int01Solution,
      _ => null,
    };
  }

  TokenCardState _cardState(String tokenId, InteractionState state) {
    if (state.phase == InteractionPhase.solution) {
      if (tokenId == session.spec.validation.correctId) {
        return TokenCardState.correct;
      }
      if (tokenId == state.lastSubmittedId) {
        return TokenCardState.incorrect;
      }
      return TokenCardState.disabled;
    }
    if (state.phase == InteractionPhase.correctFeedback &&
        tokenId == session.spec.validation.correctId) {
      return TokenCardState.correct;
    }
    if (state.phase == InteractionPhase.incorrectFeedback &&
        tokenId == state.lastSubmittedId) {
      return TokenCardState.incorrect;
    }
    if (state.phase != InteractionPhase.awaitingSelection) {
      return TokenCardState.disabled;
    }
    if (tokenId == state.selectedId) {
      return TokenCardState.selected;
    }
    return TokenCardState.defaultState;
  }

  String _stateLabel(AppLocalizations l10n, TokenCardState state) {
    return switch (state) {
      TokenCardState.defaultState => l10n.tokenStateDefault,
      TokenCardState.selected => l10n.tokenStateSelected,
      TokenCardState.correct => l10n.tokenStateCorrect,
      TokenCardState.incorrect => l10n.tokenStateIncorrect,
      TokenCardState.disabled => l10n.tokenStateDisabled,
    };
  }
}
