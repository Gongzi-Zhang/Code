'''zip: pair two sequence'''
questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy gral', 'blue']
for q, a in zip(questions, answers):
    print('What is you {0}? It is {1}'.format(q, a))

