Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D228C1E6FC
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 04:57:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0EC1CB59;
	Wed, 15 May 2019 02:57:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 113D8A49
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 02:57:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C5E0F27B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 02:57:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 319FF307D93E;
	Wed, 15 May 2019 02:57:33 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D27A5608A6;
	Wed, 15 May 2019 02:57:28 +0000 (UTC)
Subject: Re: [PATCH net] vhost_net: fix possible infinite loop
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1556177599-56248-1-git-send-email-jasowang@redhat.com>
	<20190425131021-mutt-send-email-mst@kernel.org>
	<f4b4ff70-d64f-c3fb-fe2e-97ef6c55bda0@redhat.com>
	<999ef863-2994-e0c0-fbb1-a6e92de3fd24@redhat.com>
	<20190512125959-mutt-send-email-mst@kernel.org>
	<a0d99d7a-2323-a6a8-262d-9fdc5d926384@redhat.com>
	<20190514173016-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4b51161e-37b1-cf76-d418-1574b8f6e73b@redhat.com>
Date: Wed, 15 May 2019 10:57:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514173016-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 15 May 2019 02:57:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, ppandit@redhat.com, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvNS8xNSDkuIrljYg1OjM5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gTGV0
IG1lIHRyeSB0byBleHBsYWluIGFnYWluLgo+IEF0IHRoZSBtb21lbnQgaG93IGRvZXMgaGFuZGxl
X3R4X2NvcHkgZXhpdD8KPiBJdCdzIGZvcig7Oykgc28geW91IGtub3cgeW91IG5lZWQgdG8gbG9v
ayBmb3IgYSBicmVhay4KPgo+IFdoZW4gcmVhZGluZyBjb2RlIHlvdSBhbHNvIG5vdGljZSB0aGVy
ZSdzIGEgZ290byBkb25lCj4gd2hpY2ggY291bGQgZXhpdCB0aGUgbG9vcC4gaWYgeW91IHNjYW4g
Zm9yd2FyZAo+IHlvdSBub3RpY2UgdGhhdCBpdCBkb2VzIG5vdC4KPiBUaGlzIGlzIGNvbmZ1c2lu
ZywgYnV0IG9oIHdlbGwuIFdvcnRoIGZpeGluZyBtYXliZSAuLi4KPgo+IE5vdyB5b3UgYWRkIHRo
ZSBuZXh0IHJvdW5kIGNoZWNrLgo+IEFuZCB0aGVyZSBpcyBhbHNvIHNwZWNpYWwgY29kZSB0aGF0
Cj4gZGV0ZWN0cyB3aGV0aGVyIHlvdSBleGl0ZWQgd2l0aCBicmVhawo+IGFuZCB3aGVuZXZlciB5
b3UgZGlkIGl0IGFjdHMgc3BlY2lhbGx5Lgo+Cj4gWWVhIGl0IHdvcmtzLiBCdXQgSSB0aGluayBp
dCdzIGNsZWFyZXIgaWYgd2UKPiBqdXN0IG1ha2UgdGhpbmdzIG9idmlvdXMuCj4gSWYgd2Ugd2Fu
dCBzb21ldGhpbmcgdG8gaGFwcGVuIG9uIGVycm9yIHRoZW4KPgo+IAlpZiAoZXJyb3IpCj4gCQlo
YW5kbGUKPiAJCWJyZWFrCj4KPiBpcyBpbWhvIGNsZWFyZXIgdGhhbgo+Cj4gCWZsYWcgPSB0cnVl
Cj4gCWlmIChlcnJvcikKPiAJCWJyZWFrCj4gCWZsYWcgPSBmYWxzZQo+Cj4KPiBpZiAoZmxhZykK
PiAJaGFuZGxlCj4KPiBpbiBwYXJ0dWN1bGFyIC0gbGVzcyBicmFuY2hlcyBvbiBkYXRhIHBhdGgu
Cj4KPiB5b3UgcG9pbnQgb3V0IGNvZGUgZHVwbGljYXRpb24gY29ycmVjdGx5LAo+IGJ1dCB3ZSBj
YW4gc29sdmUgaXQganVzdCBieSBhZGRpbmcgZnVuY3Rpb25zLgo+IGxpa2UgaSBzdWdnZXN0ZWQu
CgoKT2ssIEkgdGhpbmsgSSBnZXQgeW91LgoKV2lsbCB0cnkgaW4gbmV4dCB2ZXJzaW9uLgoKVGhh
bmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
