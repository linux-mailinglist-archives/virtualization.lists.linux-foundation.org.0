Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE06F70DD
	for <lists.virtualization@lfdr.de>; Mon, 11 Nov 2019 10:33:16 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC975EC2;
	Mon, 11 Nov 2019 09:33:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 628B0C58
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 09:33:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 15DA212F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 09:33:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
	mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA
	(Nemesis) id 1MJmX3-1iA5H42cmX-00K8g7 for
	<virtualization@lists.linux-foundation.org>; 
	Mon, 11 Nov 2019 10:33:03 +0100
Received: by mail-qt1-f179.google.com with SMTP id t8so14999651qtc.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 01:33:03 -0800 (PST)
X-Gm-Message-State: APjAAAX3QZZZ2+ClvtSirp93Ui5WTzUGW9b12MWEs8gQLBfR3qJ04gHo
	XzM6I1EX3+MuDH4TzE16qAkLoJjTl8gTmd/tg1o=
X-Google-Smtp-Source: APXvYqwOhN6uGhpVV7oJjqzny+sTYzdo1sn49fbiHpAlcC9Kw6k8lGkjxmDhtfyM6aJGaXQYZ3jsCTErYxjUnsB4S54=
X-Received: by 2002:ac8:67d9:: with SMTP id r25mr24767924qtp.7.1573464782536; 
	Mon, 11 Nov 2019 01:33:02 -0800 (PST)
MIME-Version: 1.0
References: <20191108170120.22331-1-will@kernel.org>
	<20191108170120.22331-2-will@kernel.org>
	<CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
	<93f80017-d65e-7c3a-29b0-d9a568d08f58@de.ibm.com>
In-Reply-To: <93f80017-d65e-7c3a-29b0-d9a568d08f58@de.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 10:32:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a21KdGKMDDPs3jc9XEg3=LbzFnGwVm+xDTB+EqGXiZorA@mail.gmail.com>
Message-ID: <CAK8P3a21KdGKMDDPs3jc9XEg3=LbzFnGwVm+xDTB+EqGXiZorA@mail.gmail.com>
Subject: Re: [PATCH 01/13] compiler.h: Split {READ, WRITE}_ONCE definitions out
	into rwonce.h
To: Christian Borntraeger <borntraeger@de.ibm.com>
X-Provags-ID: V03:K1:qtYYwngmn8toXbWRf4rbKvYT1g/h9k+Ggz0oDtulQYcDA6l+UnU
	UVbySDJi3SsLiC3dbBaPlmGAoAd9a7OYsODDzDGlaXX5/LzHgUl6CdBooRLRZiQQKcjEqbv
	QN/S+HFT7znpWOAWMDMqxmOYdH6MvoBKzK9KMiCT+ukSDR6isTW0YtbHfoMS0ZqsnFmzVsg
	qqzzFL364msxKdrIQJHhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uv08u0aQT3c=:1A3hb9exn7SKA01AOxj9Sv
	Lknh66/QOYOTTViJbUBKYKCI2BC5MTgrJpDx8LSJukUw++WCM8mBQryP45qZKkSRb6DZsK90p
	UwOMRDAVYEzzbLVOUtBXunAB3ddXzBJe7gj2h9QugRwga21hQL7geTT5ONT92O/0mNdEAgTJA
	5JBBUHGsU/ff9RmqC6O2Dh8ENFNkGwTKfv2UTH81eItBGkH/CHaeO1TIZ3PmOZxx8BU6hWOIc
	3sG7NZkyp3aGufIP3MxA2FUjjdpndxQvuIinXkyrpTpnci52yuSd0mpijt1FhE3OPQ3FfR11p
	LdYRyvHrr1txaNUAi2iVN4iYENnGmMUbFA9rULdyWDF2lY6aw4C0GUpa2g8kuehLPS3cFjj+6
	jYTzdoRr6lVTw/s3UIXBXQvjyyzY5mvIcwKOirMne0o09+v5c0yBp0BHq8+PvoF6nS29BCtbX
	0EN6X9I5OAQAr+OzbKIdxFr0BiO61OFn/K95eS0Vzx9C/W2qc8ll52oLthjPdYRCVnPquE4nj
	zXaXg0zmRaytTCpErZc5CoHaGvdtGjWKbNme7Xbp1znYv39mmyGbF9L38/c0e5+0s42fXI2sM
	fAtiMoqWZcWksYemBIg7BiqqzDqIMROgJg0xW7d1Bx6d+6r916E3RFsCcma6hCx32t7EYjKz/
	tk55ifnMiMVA3UzpuAJbmr0CiKL+hGEPOs4vLjFHy7vOox75j9TzRp2kt56epC7GgWI0B/ug4
	l+Ab6fB3zoGC7DUPXpSDTK1vjNUT7+S/4QkM+H/TxLWmOeXPVpmnIiCGnYY2sPUpvJc3g3x1t
	3U7EvoEFM1D3ud/hcmUjFli0r9diJ/m7TSRQ+4cP9w88T/Emo5kVtUctkezQGDQPFReUTKz8Q
	K8n3MXr1b1BbLPyfvJlw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	virtualization@lists.linux-foundation.org,
	Josh Triplett <josh@joshtriplett.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	SeongJae Park <sj38.park@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	alpha <linux-alpha@vger.kernel.org>, Joe Perches <joe@perches.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matt Turner <mattst88@gmail.com>, Yunjae Lee <lyj7694@gmail.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Richard Henderson <rth@twiddle.net>
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

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgOToxMCBBTSBDaHJpc3RpYW4gQm9ybnRyYWVnZXIKPGJv
cm50cmFlZ2VyQGRlLmlibS5jb20+IHdyb3RlOgo+IE9uIDA4LjExLjE5IDIwOjU3LCBBcm5kIEJl
cmdtYW5uIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgOCwgMjAxOSBhdCA2OjAxIFBNIFdpbGwgRGVh
Y29uIDx3aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gSW4gcHJlcGFyYXRpb24gZm9y
IGFsbG93aW5nIGFyY2hpdGVjdHVyZXMgdG8gZGVmaW5lIHRoZWlyIG93bgo+ID4+IGltcGxlbWVu
dGF0aW9uIG9mIHRoZSAnUkVBRF9PTkNFKCknIG1hY3JvLCBtb3ZlIHRoZSBnZW5lcmljCj4gPj4g
J3tSRUFELFdSSVRFfV9PTkNFKCknIGRlZmluaXRpb25zIG91dCBvZiB0aGUgdW53aWVsZHkgJ2xp
bnV4L2NvbXBpbGVyLmgnCj4gPj4gYW5kIGludG8gYSBuZXcgJ3J3b25jZS5oJyBoZWFkZXIgdW5k
ZXIgJ2FzbS1nZW5lcmljJy4KPiA+Cj4gPiBBZGRpbmcgQ2hyaXN0aWFuIEJvcm50csOkZ2VyIHRv
IENjLCBoZSBvcmlnaW5hbGx5IGFkZGVkIHRoZQo+ID4gUkVBRF9PTkNFKCkvV1JJVEVfT05DRSgp
Cj4gPiBjb2RlLgo+ID4KPiA+IEkgd29uZGVyIGlmIGl0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIG5v
dyB0byByZXZlcnQgYmFjayB0byBhIG11Y2ggc2ltcGxlciB2ZXJzaW9uCj4gPiBvZiB0aGVzZSBo
ZWxwZXJzIGZvciBhbnkgbW9kZXJuIGNvbXBpbGVyLiBBcyBJIHVuZGVyc3RhbmQsIG9ubHkgZ2Nj
LTQuNiBhbmQKPiA+IGdjYzQuNyBhY3R1YWxseSBuZWVkIHRoZSBzb25nLWFuZC1kYW5jZSB2ZXJz
aW9uIHdpdGggdGhlIHVuaW9uIGFuZCBzd2l0Y2gvY2FzZSwKPiA+IHdoaWxlIGZvciBvdGhlcnMs
IHdlIGNhbiBtaWdodCBiZSBhYmxlIGJhY2sgdG8gYSBtYWNybyBkb2luZyBhIHZvbGF0aWxlIGFj
Y2Vzcy4KPgo+IEFzIGZhciBhcyBJIGtub3cgdGhpcyBwYXJ0aWN1bGFyIGlzc3VlIHdpdGggIHZv
bGF0aWxlIGFjY2VzcyBvbiBhZ2dyZWdhdGUgdHlwZXMKPiB3YXMgZml4ZWQgaW4gZ2NjIDQuOC4g
T24gdGhlIG90aGVyIGhhbmQgd2Uga25vdyB0aGF0IHRoZSBjdXJyZW50IGNvbnN0cnVjdCB3aWxs
Cj4gd29yayBvbiBhbGwgY29tcGlsZXJzLiBOb3Qgc28gc3VyZSBhYm91dCB0aGUgb3JpZ25hbCBB
Q0NFU1NfT05DRSBpbXBsZW1lbnRhdGlvbi4KCkkndmUgc2VlbiBwcm9ibGVtcyB3aXRoIGNsYW5n
IG9uIHRoZSBjdXJyZW50IHZlcnNpb24sIGxlYWRpbmcgdG8gdW5uZWNlc3NhcnkKdGVtcG9yYXJp
ZXMgYmVpbmcgc3BpbGxlZCB0byB0aGUgc3RhY2sgaW4gc29tZSBjYXNlcywgc28gSSB0aGluayBp
dCB3b3VsZCBzdGlsbApoZWxwIHRvIHNpbXBsaWZ5IGl0LgoKV2UgcHJvYmFibHkgZG9uJ3Qgd2Fu
dCB0aGUgZXhhY3QgQUNDRVNTX09OQ0UoKSBpbXBsZW1lbnRhdGlvbiBiYWNrCnRoYXQgZXhpc3Rl
ZCBiZWZvcmUsIGJ1dCByYXRoZXIgc29tZXRoaW5nIHRoYXQgaW1wbGVtZW50cyB0aGUgc3RyaWN0
ZXIKUkVBRF9PTkNFKCkgYW5kIFdSSVRFX09OQ0UoKS4gSSdkIHByb2JhYmx5IGFsc28gd2FudCB0
byBhdm9pZCB0aGUKX19idWlsdGluX21lbWNweSgpIGV4Y2VwdGlvbiBmb3Igb2RkLXNpemVkIGFj
Y2Vzc2VzIGFuZCBpbnN0ZWFkIGhhdmUKYSBzZXBhcmF0ZSB3YXkgdG8gZG8gdGhvc2UuCgogICAg
ICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
