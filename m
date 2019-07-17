Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D626BE38
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 16:29:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80562F04;
	Wed, 17 Jul 2019 14:28:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C4425F04
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 14:28:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 840A38A3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 14:28:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C24C6308FBAC;
	Wed, 17 Jul 2019 14:28:52 +0000 (UTC)
Received: from redhat.com (ovpn-125-71.rdu2.redhat.com [10.10.125.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0320719C68;
	Wed, 17 Jul 2019 14:28:45 +0000 (UTC)
Date: Wed, 17 Jul 2019 10:28:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 00/15] Packed virtqueue support for vhost
Message-ID: <20190717102824-mutt-send-email-mst@kernel.org>
References: <20190717105255.63488-1-jasowang@redhat.com>
	<20190717070100-mutt-send-email-mst@kernel.org>
	<af066030-96f1-4a8d-4864-7b6b903477a6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af066030-96f1-4a8d-4864-7b6b903477a6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 17 Jul 2019 14:28:52 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDg6Mjc6MjhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMTcg5LiL5Y2INzowMiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDY6NTI6NDBBTSAtMDQwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gSGkgYWxsOgo+ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMgaW1wbGVtZW50
cyBwYWNrZWQgdmlydHF1ZXVlcyB3aGljaCB3ZXJlIGRlc2NyaWJlZAo+ID4gPiBhdCBbMV0uIElu
IHRoaXMgdmVyc2lvbiB3ZSB0cnkgdG8gYWRkcmVzcyB0aGUgcGVyZm9ybWFuY2UgcmVncmVzc2lv
bgo+ID4gPiBzYXcgYnkgVjIuIFRoZSByb290IGNhdXNlIGlzIHBhY2tlZCB2aXJ0cXVldWUgbmVl
ZCBtb3JlIHRpbWVzIG9mCj4gPiA+IHVzZXJzcGFjZSBtZW1vcnkgYWNjZXNzc2luZyB3aGljaCB0
dXJucyBvdXQgdG8gYmUgdmVyeQo+ID4gPiBleHBlbnNpdmUuIFRoYW5rcyB0byB0aGUgaGVscCBv
ZiA3ZjQ2NjAzMmRjOWUgKCJ2aG9zdDogYWNjZXNzIHZxCj4gPiA+IG1ldGFkYXRhIHRocm91Z2gg
a2VybmVsIHZpcnR1YWwgYWRkcmVzcyIpLCBzdWNoIG92ZXJoZWFkIGNvbGQgYmUKPiA+ID4gZWxp
bWluYXRlZC4gU28gaW4gdGhpcyB2ZXJzaW9uLCB3ZSBjYW4gc2VlIGFib3V0IDIlIGltcHJvdmVt
ZW50IGZvcgo+ID4gPiBwYWNrZWQgdmlydHF1ZXVlIG9uIFBQUy4KPiA+IEdyZWF0IGpvYiwgdGhh
bmtzIQo+ID4gUGxzIGFsbG93IGEgYml0IG1vcmUgcmV2aWV3IHRpbWUgdGhhbiB1c3VhbCBhcyB0
aGlzIGlzIGEgYmlnIHBhdGNoc2V0Lgo+ID4gU2hvdWxkIGJlIGRvbmUgYnkgVHVlc2RheS4KPiA+
IC1uZXh0IG1hdGVyaWFsIGFueXdheS4KPiAKPiAKPiBTdXJlLCBqdXN0IHRvIGNvbmZpcm0sIEkg
dGhpbmsgdGhpcyBzaG91bGQgZ28gZm9yIHlvdXIgdmhvc3QgdHJlZT8uCj4gCj4gVGhhbmtzCgpJ
IHRoaW5rIHRoaXMgbWFrZXMgc2Vuc2UsIHllcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
