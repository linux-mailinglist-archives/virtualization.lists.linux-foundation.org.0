Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57171F55C2
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 21:02:47 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 389E4DDC;
	Fri,  8 Nov 2019 20:02:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF9D7DDC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 20:02:38 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EED5F844
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 20:02:37 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
	mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA
	(Nemesis) id 1MUGuZ-1iKbwe1syB-00RFVh for
	<virtualization@lists.linux-foundation.org>; 
	Fri, 08 Nov 2019 20:57:31 +0100
Received: by mail-qk1-f170.google.com with SMTP id i19so6392752qki.2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 08 Nov 2019 11:57:31 -0800 (PST)
X-Gm-Message-State: APjAAAUuW77DQ6gFbrsCFOGPdVURbRt3R1fhWU8NqIEOiYZAU7EfwIve
	dr6Ad/ZMUg9ZbtDt/nydqfa5eNrqnpAMqQU9xqo=
X-Google-Smtp-Source: APXvYqwbEOv9N5n3ZVSMCaT2AayZZFizNM7xZNN/vq5TItdY6JMB/hXbfpzfEILBcvqaJNvSbipOgEpXoOH0B2jqyjk=
X-Received: by 2002:a37:4f13:: with SMTP id d19mr10475357qkb.138.1573243050314;
	Fri, 08 Nov 2019 11:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20191108170120.22331-1-will@kernel.org>
	<20191108170120.22331-2-will@kernel.org>
In-Reply-To: <20191108170120.22331-2-will@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Nov 2019 20:57:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
Message-ID: <CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
Subject: Re: [PATCH 01/13] compiler.h: Split {READ, WRITE}_ONCE definitions out
	into rwonce.h
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:q1Yam/o29NjAH4ey6WRM7xNq+9u2kqVfOlks9fN0rl/QSmwODV2
	FjfP+4JvBKthqedJmT/DB7Lw8zKh6HUmsgjN8G81zQKa++c6UWI71MyFU/yCDoUZ7zSva1O
	kYtLr1GdGnv0qpPXgKjRfIUxSkz7Y0o4dMgJ2to2rXQA+8L9LhML3WodL/X+Q+75dMfkZEK
	qJJ1Fz4lZHqUAfiU3+yTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KC3IFQmVi1M=:vVbaySIOh9/26+oLbyDfRS
	TJ//IGOwL12oKCSDVKZtkS63WrRmCcgZZ43peowzB8GiqbN0Bgch+qTUOZ2LEy5WwcV/bW/qc
	Ps3CdGCgAjQQ7tx0BRUm8C+zr/Ops9MFx7AIDocsui/q5/AiFvznNEpQG9KIuELe0G/X2tRPq
	PG2O2lpJuh0eYmaTFusVgSiLEFjOEbzVH6RwBIuzf3kJTZAiFG0r47gR5ZvnPT4T4kP9l2o+3
	vu3wd1x3nLM7etbDCJ3In5Q4pbl4vSBEhZ/hrjMbfaQD7T5Ft0UlHMTp+mBxkHv69chv5QYcA
	3HVeO825Ynb9fmswDOqOz2QPTLe1uy4vX67fNV3zp0q9T/DVqT+6NKxiTNaqazf7IFHm6dtUF
	0uRaCNyAEFSPPgbuKCaK/ZFRufP4E9J9qp0GvBLSGnJXNidYSApxquYPeUu4jVB2+rFEkSeqr
	kFUnD1GpvYu8lTQAoenfrE4wI9I6V04Ft3KqsDxCAtZuec9E1qG88o8TAvc9/U4HJKYHd92Fw
	+DoZUJWGdNwWYDJtdea9LdZ2OYGZ2HFlEa5VinW8letyLqGIyeEK50jsatWsQBAWiO/vVzOBi
	ce77OWw5cqbFgYdBHTkr1gNvse7oU4CfduVFKNxn6jWwsdtL4Etztm1R6bM4d5XUX4ua+YlZj
	ukJ+g/muJLISH/sJEQ0x8DDNovYKrRL7NDThuat97Gx/bC0tjwhAMPDR7qSk8UDYtsUVl3+eC
	b1SdcJKFCoV5fJPmcAJs2EDwMzeR4deltHUZa1fblsi1+isT1IbF8bVOXsC+4mY0w7Y5vNrZN
	BO0yWBmofNQUveyTggS20UATvzZZGjlWEgTSAzOIn26B3YgcEbcxFAtAScbJpNjcQwfYybiEt
	ZnYn5vRp3GWj3jGjYvaA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Josh Triplett <josh@joshtriplett.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	SeongJae Park <sj38.park@gmail.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	alpha <linux-alpha@vger.kernel.org>, Joe Perches <joe@perches.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matt Turner <mattst88@gmail.com>, Yunjae Lee <lyj7694@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <rth@twiddle.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCA2OjAxIFBNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gSW4gcHJlcGFyYXRpb24gZm9yIGFsbG93aW5nIGFyY2hpdGVjdHVyZXMg
dG8gZGVmaW5lIHRoZWlyIG93bgo+IGltcGxlbWVudGF0aW9uIG9mIHRoZSAnUkVBRF9PTkNFKCkn
IG1hY3JvLCBtb3ZlIHRoZSBnZW5lcmljCj4gJ3tSRUFELFdSSVRFfV9PTkNFKCknIGRlZmluaXRp
b25zIG91dCBvZiB0aGUgdW53aWVsZHkgJ2xpbnV4L2NvbXBpbGVyLmgnCj4gYW5kIGludG8gYSBu
ZXcgJ3J3b25jZS5oJyBoZWFkZXIgdW5kZXIgJ2FzbS1nZW5lcmljJy4KCkFkZGluZyBDaHJpc3Rp
YW4gQm9ybnRyw6RnZXIgdG8gQ2MsIGhlIG9yaWdpbmFsbHkgYWRkZWQgdGhlClJFQURfT05DRSgp
L1dSSVRFX09OQ0UoKQpjb2RlLgoKSSB3b25kZXIgaWYgaXQgd291bGQgYmUgYXBwcm9wcmlhdGUg
bm93IHRvIHJldmVydCBiYWNrIHRvIGEgbXVjaCBzaW1wbGVyIHZlcnNpb24Kb2YgdGhlc2UgaGVs
cGVycyBmb3IgYW55IG1vZGVybiBjb21waWxlci4gQXMgSSB1bmRlcnN0YW5kLCBvbmx5IGdjYy00
LjYgYW5kCmdjYzQuNyBhY3R1YWxseSBuZWVkIHRoZSBzb25nLWFuZC1kYW5jZSB2ZXJzaW9uIHdp
dGggdGhlIHVuaW9uIGFuZCBzd2l0Y2gvY2FzZSwKd2hpbGUgZm9yIG90aGVycywgd2UgY2FuIG1p
Z2h0IGJlIGFibGUgYmFjayB0byBhIG1hY3JvIGRvaW5nIGEgdm9sYXRpbGUgYWNjZXNzLgoKICAg
ICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
