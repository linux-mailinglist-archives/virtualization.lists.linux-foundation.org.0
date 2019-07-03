Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 443775E67C
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 16:23:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48A4B1081;
	Wed,  3 Jul 2019 14:23:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC5811010
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:21:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D4D0898
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org;
	s=ds201810; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cCNufxrn9tlhF9iiTm+jRiUtsAAISvATmgvul/+3f2w=; 
	b=WHc1nMWEDt5szjysyh+U2x6qJ1aGMUXgwozzxl71Szo11Z6BLTgR3cJBp26QopSeSaJSNew/bpdIvSwetM7vTfuGnvVuQs+JCHNQcLClcGvTCyixExPHSjfa9XDB66AfXS01qe+in3UjbdZ53QHtcy7s9qtRrfjh8ss48Y7a1+GN0Q2B3tUfTTwCzuXEkIcbFoDEKz5DOb4da5S7Zucn+z8DTO8lNX3BdAz+X7dMsOrwwrEWPE60JnPqI6eh487MVF+XW7Nbu3VuihejFsBXdm6R5dl7U4nhYQrNhECOlwMGNOMW6IlOaXS1IrzzS/GkCX2VcimIcVv9a5pIjW98eA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62964
	helo=[192.168.10.173]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <noralf@tronnes.org>)
	id 1hig8g-0000t2-7a; Wed, 03 Jul 2019 16:21:38 +0200
Subject: Re: [PATCH 4/5] drm/bochs: Use shadow buffer for bochs framebuffer
	console
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
	daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com, 
	maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
	yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
	<20190703083302.2609-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e401d084-3a13-701e-3f46-e59e66b6cceb@tronnes.org>
Date: Wed, 3 Jul 2019 16:21:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703083302.2609-5-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

CgpEZW4gMDMuMDcuMjAxOSAxMC4zMywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlIGJv
Y2hzIGRyaXZlciAoYW5kIHZpcnR1YWwgaGFyZHdhcmUpIHJlcXVpcmVzIGJ1ZmZlciBvYmplY3Rz
IHRvCj4gcmVzaWRlIGluIHZpZGVvIHJhbSB0byBkaXNwbGF5IHRoZW0gdG8gdGhlIHNjcmVlbi4g
U28gaXQgY2FuIG5vdAo+IGRpc3BsYXkgdGhlIGZyYW1lYnVmZmVyIGNvbnNvbGUgYmVjYXVzZSB0
aGUgcmVzcGVjdGl2ZSBidWZmZXIgb2JqZWN0Cj4gaXMgcGVybWFuZW50bHkgcGlubmVkIGluIHN5
c3RlbSBtZW1vcnkuCj4gCj4gVXNpbmcgYSBzaGFkb3cgYnVmZmVyIGZvciB0aGUgY29uc29sZSBz
b2x2ZXMgdGhpcyBwcm9ibGVtLiBUaGUgY29uc29sZQo+IGVtdWxhdGlvbiB3aWxsIHBpbiB0aGUg
YnVmZmVyIG9iamVjdCBvbmx5IGR1cmluZyB1cGRhdGVzIGZyb20gdGhlIHNoYWRvdwo+IGJ1ZmZl
ci4gT3RoZXJ3aXNlLCB0aGUgYm9jaHMgZHJpdmVyIGNhbiBmcmVlbHkgcmVsb2NhdGVkIHRoZSBi
dWZmZXIKPiBiZXR3ZWVuIHN5c3RlbSBtZW1vcnkgYW5kIHZpZGVvIHJhbS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAtLS0KCkFj
a2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
