Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D322197C4
	for <lists.virtualization@lfdr.de>; Fri, 10 May 2019 06:48:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2CE21DBE;
	Fri, 10 May 2019 04:48:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A258ADBE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 04:48:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 61E071FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 04:48:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5604308339A;
	Fri, 10 May 2019 04:48:16 +0000 (UTC)
Received: from [10.72.12.54] (ovpn-12-54.pek2.redhat.com [10.72.12.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CE635C296;
	Fri, 10 May 2019 04:48:10 +0000 (UTC)
Subject: Re: [RFC PATCH V2] vhost: don't use kmap() to log dirty pages
From: Jason Wang <jasowang@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1557406680-4087-1-git-send-email-jasowang@redhat.com>
	<20190509090433-mutt-send-email-mst@kernel.org>
	<d6d69a36-9a3a-2a21-924e-97fdcc6e6733@redhat.com>
Message-ID: <fa6444aa-9c46-22f0-204a-c7592dc5bd51@redhat.com>
Date: Fri, 10 May 2019 12:48:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d6d69a36-9a3a-2a21-924e-97fdcc6e6733@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 10 May 2019 04:48:16 +0000 (UTC)
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

Ck9uIDIwMTkvNS8xMCDkuIrljYgxMDo1OSwgSmFzb24gV2FuZyB3cm90ZToKPj4+Cj4+PiDCoCDC
oMKgwqDCoMKgIHIgPSBnZXRfdXNlcl9wYWdlc19mYXN0KGxvZywgMSwgMSwgJnBhZ2UpOwo+PiBP
SyBzbyB0aGUgdHJpY2sgaXMgdGhhdCBwYWdlIGlzIHBpbm5lZCBzbyB5b3UgZG9uJ3QgZXhwZWN0
Cj4+IGFyY2hfZnV0ZXhfYXRvbWljX29wX2ludXNlciBiZWxvdyB0byBmYWlsLsKgIGdldF91c2Vy
X3BhZ2VzX2Zhc3QKPj4gZ3VhcmFudGVlcyBwYWdlIGlzIG5vdCBnb2luZyBhd2F5IGJ1dCBkb2Vz
IGl0IGd1YXJhbnRlZSBQVEUgd29uJ3QgYmUKPj4gaW52YWlkYXRlZCBvciB3cml0ZSBwcm90ZWN0
ZWQ/Cj4KPgo+IEdvb2QgcG9pbnQsIHRoZW4gSSB0aGluayB3ZSBwcm9iYWJseSBuZWVkIHRvIGRv
IG1hbnVhbCBmaXh1cCB0aHJvdWdoIAo+IGZpeHVwX3VzZXJfZmF1bHQoKSBpZiBhcmNoX2Z1dGV4
X2F0b21pY19vcF9pbl91c2VyKCkgZmFpbC4gCgoKVGhpcyBsb29rcyBsaWtlIGEgb3ZlcmtpbGws
IHdlIGRvbid0IG5lZWQgdG8gYXRvbWljIGVudmlyb25tZW50IGhlcmUgCmFjdHVhbGx5LiBJbnN0
ZWFkLCBqdXN0IGtlZXAgcGFnZWZhdWx0IGVuYWJsZWQgc2hvdWxkIHdvcmsuIFNvIGp1c3QgCmlu
dHJvZHVjZSBhcmNoX2Z1dGV4X2F0b21pY19vcF9pbnVzZXJfaW5hdG9taWMoKSB2YXJpYW50IHdp
dGggcGFnZWZhdWx0IApkaXNhYmxlZCB0aGVyZSBqdXN0IGZvciBmdXRleCBzaG91bGQgYmUgc3Vm
ZmljaWVudC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
