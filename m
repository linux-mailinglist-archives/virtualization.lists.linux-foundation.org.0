Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9E1AFF8
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 07:22:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F3BEB59;
	Mon, 13 May 2019 05:22:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6BD3F9D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 05:22:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5D07427B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 05:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B999330833BE;
	Mon, 13 May 2019 05:22:45 +0000 (UTC)
Received: from [10.72.12.49] (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5083844;
	Mon, 13 May 2019 05:22:39 +0000 (UTC)
Subject: Re: [RFC PATCH V2] vhost: don't use kmap() to log dirty pages
From: Jason Wang <jasowang@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1557406680-4087-1-git-send-email-jasowang@redhat.com>
	<20190509090433-mutt-send-email-mst@kernel.org>
	<d6d69a36-9a3a-2a21-924e-97fdcc6e6733@redhat.com>
	<fa6444aa-9c46-22f0-204a-c7592dc5bd51@redhat.com>
Message-ID: <e713f08b-b460-0094-fd28-f838c9efdff1@redhat.com>
Date: Mon, 13 May 2019 13:22:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fa6444aa-9c46-22f0-204a-c7592dc5bd51@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 13 May 2019 05:22:45 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvNS8xMCDkuIvljYgxMjo0OCwgSmFzb24gV2FuZyB3cm90ZToKPgo+IE9uIDIwMTkv
NS8xMCDkuIrljYgxMDo1OSwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pgo+Pj4+IMKgIMKgwqDCoMKg
wqAgciA9IGdldF91c2VyX3BhZ2VzX2Zhc3QobG9nLCAxLCAxLCAmcGFnZSk7Cj4+PiBPSyBzbyB0
aGUgdHJpY2sgaXMgdGhhdCBwYWdlIGlzIHBpbm5lZCBzbyB5b3UgZG9uJ3QgZXhwZWN0Cj4+PiBh
cmNoX2Z1dGV4X2F0b21pY19vcF9pbnVzZXIgYmVsb3cgdG8gZmFpbC4gZ2V0X3VzZXJfcGFnZXNf
ZmFzdAo+Pj4gZ3VhcmFudGVlcyBwYWdlIGlzIG5vdCBnb2luZyBhd2F5IGJ1dCBkb2VzIGl0IGd1
YXJhbnRlZSBQVEUgd29uJ3QgYmUKPj4+IGludmFpZGF0ZWQgb3Igd3JpdGUgcHJvdGVjdGVkPwo+
Pgo+Pgo+PiBHb29kIHBvaW50LCB0aGVuIEkgdGhpbmsgd2UgcHJvYmFibHkgbmVlZCB0byBkbyBt
YW51YWwgZml4dXAgdGhyb3VnaCAKPj4gZml4dXBfdXNlcl9mYXVsdCgpIGlmIGFyY2hfZnV0ZXhf
YXRvbWljX29wX2luX3VzZXIoKSBmYWlsLiAKPgo+Cj4gVGhpcyBsb29rcyBsaWtlIGEgb3Zlcmtp
bGwsIHdlIGRvbid0IG5lZWQgdG8gYXRvbWljIGVudmlyb25tZW50IGhlcmUgCj4gYWN0dWFsbHku
IEluc3RlYWQsIGp1c3Qga2VlcCBwYWdlZmF1bHQgZW5hYmxlZCBzaG91bGQgd29yay4gU28ganVz
dCAKPiBpbnRyb2R1Y2UgYXJjaF9mdXRleF9hdG9taWNfb3BfaW51c2VyX2luYXRvbWljKCkgdmFy
aWFudCB3aXRoIAo+IHBhZ2VmYXVsdCBkaXNhYmxlZCB0aGVyZSBqdXN0IGZvciBmdXRleCBzaG91
bGQgYmUgc3VmZmljaWVudC4KPgo+IFRoYW5rcwoKCk9rLCBpbnN0ZWFkIG9mIHVzaW5nIHRyaWNr
cywgSSB0aGluayB3ZSBjYW4gZ3JhY2VmdWxseSBmYWxsYmFjayB0byBhIApnZXRfdXNlcigpL3B1
dF91c2VyKCkgcGFpciBwcm90ZWN0ZWQgYnkgYSBtdXRleC4KCkxldCBtZSBwb3N0IGEgbm9uLXJm
YyB2ZXJzaW9uIGZvciB0aGlzLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
