import 'package:flutter/material.dart';
import '../models/interaction_spec.dart';

enum TokenState { defaultState, selected, correct, incorrect, disabled }

class TokenWordCard extends StatelessWidget {
  final TokenWord token;
  final TokenState state;
  final VoidCallback onTap;
  final bool reduceMotion;

  const TokenWordCard({
    Key? key,
    required this.token,
    required this.state,
    required this.onTap,
    this.reduceMotion = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
      child: GestureDetector(
        onTap: state == TokenState.disabled ? null : onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _getOpacityForState(state),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _getColorForState(state), 
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              token.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  double _getOpacityForState(TokenState state) {
    return state == TokenState.disabled ? 0.5 : 1.0;
  }

  Color _getColorForState(TokenState state) {
    switch (state) {
      case TokenState.selected: return Colors.blue.shade100;
      case TokenState.correct: return Colors.green.shade100;
      case TokenState.incorrect: return Colors.red.shade100;
      default: return Colors.white;
    }
  }
}