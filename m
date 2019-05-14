Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B61C119
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 05:42:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8AD9EBB3;
	Tue, 14 May 2019 03:42:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F1E45B6C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 03:42:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B58827B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 03:42:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D405D3092667;
	Tue, 14 May 2019 03:42:20 +0000 (UTC)
Received: from [10.72.12.59] (ovpn-12-59.pek2.redhat.com [10.72.12.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2679E608AB;
	Tue, 14 May 2019 03:42:12 +0000 (UTC)
Subject: Re: [PATCH net] vhost: don't use kmap() to log dirty pages
To: David Miller <davem@davemloft.net>
References: <1557725265-63525-1-git-send-email-jasowang@redhat.com>
	<20190513.094218.1962516460150696760.davem@davemloft.net>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c8369a44-f4e0-4132-b470-cca7a044bb02@redhat.com>
Date: Tue, 14 May 2019 11:42:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513.094218.1962516460150696760.davem@davemloft.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 14 May 2019 03:42:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, James.Bottomley@HansenPartnership.com,
	kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, hch@infradead.org,
	mingo@redhat.com, dvhart@infradead.org, tglx@linutronix.de
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

Ck9uIDIwMTkvNS8xNCDkuIrljYgxMjo0MiwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+IEZyb206IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gRGF0ZTogTW9uLCAxMyBNYXkgMjAxOSAw
MToyNzo0NSAtMDQwMAo+Cj4+IFZob3N0IGxvZyBkaXJ0eSBwYWdlcyBkaXJlY3RseSB0byBhIHVz
ZXJzcGFjZSBiaXRtYXAgdGhyb3VnaCBHVVAgYW5kCj4+IGttYXBfYXRvbWljKCkgc2luY2Uga2Vy
bmVsIGRvZXNuJ3QgaGF2ZSBhIHNldF9iaXRfdG9fdXNlcigpCj4+IGhlbHBlci4gVGhpcyB3aWxs
IGNhdXNlIGlzc3VlcyBmb3IgdGhlIGFyY2ggdGhhdCBoYXMgdmlydHVhbGx5IHRhZ2dlZAo+PiBj
YWNoZXMuIFRoZSB3YXkgdG8gZml4IGlzIHRvIGtlZXAgdXNpbmcgdXNlcnNwYWNlIHZpcnR1YWwK
Pj4gYWRkcmVzcy4gRm9ydHVuYXRlbHksIGZ1dGV4IGhhcyBhcmNoX2Z1dGV4X2F0b21pY19vcF9p
bnVzZXIoKSB3aGljaAo+PiBjb3VsZCBiZSB1c2VkIGZvciBzZXR0aW5nIGEgYml0IHRvIHVzZXIu
Cj4+Cj4+IE5vdGUgdGhlcmUncmUgc2V2ZXJhbCBjYXNlcyB0aGF0IGZ1dGV4IGhlbHBlciBjYW4g
ZmFpbCBlLmcgYSBwYWdlCj4+IGZhdWx0IG9yIHRoZSBhcmNoIHRoYXQgZG9lc24ndCBoYXZlIHRo
ZSBzdXBwb3J0LiBGb3IgdGhvc2UgY2FzZXMsIGEKPj4gc2ltcGxpZmllZCBnZXRfdXNlcigpL3B1
dF91c2VyKCkgcGFpciBwcm90ZWN0ZWQgYnkgYSBnbG9iYWwgbXV0ZXggaXMKPj4gcHJvdmlkZWQg
YXMgYSBmYWxsYmFjay4gVGhlIGZhbGxiYWNrIG1heSBsZWFkIGZhbHNlIHBvc2l0aXZlIHRoYXQK
Pj4gdXNlcnNwYWNlIG1heSBzZWUgbW9yZSBkaXJ0eSBwYWdlcy4KPj4KPj4gQ2M6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KPj4gQ2M6IEphbWVzIEJvdHRvbWxleSA8SmFt
ZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT4KPj4gQ2M6IEFuZHJlYSBBcmNhbmdl
bGkgPGFhcmNhbmdlQHJlZGhhdC5jb20+Cj4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KPj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+PiBDYzog
UGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+PiBDYzogRGFycmVuIEhhcnQg
PGR2aGFydEBpbmZyYWRlYWQub3JnPgo+PiBGaXhlczogM2E0ZDVjOTRlOTU5MyAoInZob3N0X25l
dDogYSBrZXJuZWwtbGV2ZWwgdmlydGlvIHNlcnZlciIpCj4+IFNpZ25lZC1vZmYtYnk6IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gSSB3YW50IHRvIHNlZSBhIHJldmlldyBmcm9t
IE1pY2hhZWwgZm9yIHRoaXMgY2hhbmdlIGJlZm9yZSBhcHBseWluZy4KCgpObyBwcm9ibGVtLCBz
aW5jZSBrYnVpbGQgc3BvdHRlZCBhbiBpc3N1ZS4gTGV0IG1lIHBvc3QgVjIuCgpUaGFua3MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
