Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B66BC42
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 14:27:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1014FE81;
	Wed, 17 Jul 2019 12:27:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D04CA9EE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 12:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73FD571C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 12:27:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA9753DE0F;
	Wed, 17 Jul 2019 12:27:39 +0000 (UTC)
Received: from [10.72.12.61] (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2E12600C8;
	Wed, 17 Jul 2019 12:27:30 +0000 (UTC)
Subject: Re: [PATCH V3 00/15] Packed virtqueue support for vhost
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190717105255.63488-1-jasowang@redhat.com>
	<20190717070100-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <af066030-96f1-4a8d-4864-7b6b903477a6@redhat.com>
Date: Wed, 17 Jul 2019 20:27:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717070100-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 17 Jul 2019 12:27:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, maxime.coquelin@redhat.com
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

Ck9uIDIwMTkvNy8xNyDkuIvljYg3OjAyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBKdWwgMTcsIDIwMTkgYXQgMDY6NTI6NDBBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gSGkgYWxsOgo+Pgo+PiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIHBhY2tlZCB2aXJ0cXVldWVz
IHdoaWNoIHdlcmUgZGVzY3JpYmVkCj4+IGF0IFsxXS4gSW4gdGhpcyB2ZXJzaW9uIHdlIHRyeSB0
byBhZGRyZXNzIHRoZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uCj4+IHNhdyBieSBWMi4gVGhlIHJv
b3QgY2F1c2UgaXMgcGFja2VkIHZpcnRxdWV1ZSBuZWVkIG1vcmUgdGltZXMgb2YKPj4gdXNlcnNw
YWNlIG1lbW9yeSBhY2Nlc3NzaW5nIHdoaWNoIHR1cm5zIG91dCB0byBiZSB2ZXJ5Cj4+IGV4cGVu
c2l2ZS4gVGhhbmtzIHRvIHRoZSBoZWxwIG9mIDdmNDY2MDMyZGM5ZSAoInZob3N0OiBhY2Nlc3Mg
dnEKPj4gbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIiksIHN1Y2ggb3Zl
cmhlYWQgY29sZCBiZQo+PiBlbGltaW5hdGVkLiBTbyBpbiB0aGlzIHZlcnNpb24sIHdlIGNhbiBz
ZWUgYWJvdXQgMiUgaW1wcm92ZW1lbnQgZm9yCj4+IHBhY2tlZCB2aXJ0cXVldWUgb24gUFBTLgo+
IEdyZWF0IGpvYiwgdGhhbmtzIQo+IFBscyBhbGxvdyBhIGJpdCBtb3JlIHJldmlldyB0aW1lIHRo
YW4gdXN1YWwgYXMgdGhpcyBpcyBhIGJpZyBwYXRjaHNldC4KPiBTaG91bGQgYmUgZG9uZSBieSBU
dWVzZGF5Lgo+IC1uZXh0IG1hdGVyaWFsIGFueXdheS4KCgpTdXJlLCBqdXN0IHRvIGNvbmZpcm0s
IEkgdGhpbmsgdGhpcyBzaG91bGQgZ28gZm9yIHlvdXIgdmhvc3QgdHJlZT8uCgpUaGFua3MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
