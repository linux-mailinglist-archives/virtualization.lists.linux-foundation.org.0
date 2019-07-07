Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE16153D
	for <lists.virtualization@lfdr.de>; Sun,  7 Jul 2019 16:34:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7B5D61E5F;
	Sun,  7 Jul 2019 14:34:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8622B1E57
	for <virtualization@lists.linux-foundation.org>;
	Sun,  7 Jul 2019 14:25:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0E829827
	for <virtualization@lists.linux-foundation.org>;
	Sun,  7 Jul 2019 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org;
	s=ds201810; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bsfRy9iyigym871+zHxGVU81WWGcFG7FZVY068+um8o=; 
	b=OEH6jyX5qwwuBZ1RsSKhHyyePjUinjKtFkUDIOsO+1GOTdaH6Z9gO8JNLOcvo+0+uKkvoIuF4YlG2S5eMR2MvMWONQm0gBmfZ99RpYCwOUXxIVZzt6gclSbFl2HzndN8iXisLzhdpFgxPfS/ckM86SHETe01vF1IEWJupREToF4x+IbTXyQIMkMTwMUKwUyNewgLi5YkQ1AzVd2RTn6fzy4n2Nux+rYUiGdVkHdqSm8F8VoFP8YalnRvm63OfTh55WwzqOLjmi1sHWLRbOQ6adAPI5EWrIwYgNvka/UFE9xOM+MES/JKlHYGkt4LzrRM3czn/cG7e1vKGClI2WJumg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61619
	helo=[192.168.10.173]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <noralf@tronnes.org>)
	id 1hk86f-0001hs-WD; Sun, 07 Jul 2019 16:25:34 +0200
Subject: Re: [PATCH v2 2/6] drm/fb-helper: Map DRM client buffer only when
	required
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
	daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com, 
	maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
	yc_chen@aspeedtech.com
References: <20190705092613.7621-1-tzimmermann@suse.de>
	<20190705092613.7621-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f437366d-9dc2-c160-3b52-ae3650a5e1a2@tronnes.org>
Date: Sun, 7 Jul 2019 16:25:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705092613.7621-3-tzimmermann@suse.de>
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

CgpEZW4gMDUuMDcuMjAxOSAxMS4yNiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhpcyBw
YXRjaCBjaGFuZ2VzIERSTSBjbGllbnRzIHRvIG5vdCBtYXAgdGhlIGJ1ZmZlciBieSBkZWZhdWx0
LiBUaGUKPiBidWZmZXIsIGxpa2UgYW55IGJ1ZmZlciBvYmplY3QsIHNob3VsZCBiZSBtYXBwZWQg
YW5kIHVubWFwcGVkIHdoZW4KPiBuZWVkZWQuCj4gCj4gQW4gdW5tYXBwZWQgYnVmZmVyIG9iamVj
dCBjYW4gYmUgZXZpY3RlZCB0byBzeXN0ZW0gbWVtb3J5IGFuZCBkb2VzCj4gbm90IGNvbnN1bWUg
dmlkZW8gcmFtIHVudGlsIGRpc3BsYXllZC4gVGhpcyBhbGxvd3MgdG8gdXNlIGdlbmVyaWMgZmJk
ZXYKPiBlbXVsYXRpb24gd2l0aCBkcml2ZXJzIGZvciBsb3ctbWVtb3J5IGRldmljZXMsIHN1Y2gg
YXMgYXN0IGFuZCBtZ2FnMjAwLgo+IAo+IFRoaXMgY2hhbmdlIGFmZmVjdHMgdGhlIGdlbmVyaWMg
ZnJhbWVidWZmZXIgY29uc29sZS4gSFctYmFzZWQgY29uc29sZXMKPiBtYXAgdGhlaXIgY29uc29s
ZSBidWZmZXIgb25jZSBhbmQga2VlcCBpdCBtYXBwZWQuIFVzZXJzcGFjZSBjYW4gbW1hcCB0aGlz
Cj4gYnVmZmVyIGludG8gaXRzIGFkZHJlc3Mgc3BhY2UuIFRoZSBzaGFkb3ctYnVmZmVyZWQgZnJh
bWVidWZmZXIgY29uc29sZQo+IG9ubHkgbmVlZHMgdGhlIGJ1ZmZlciBvYmplY3QgdG8gYmUgbWFw
cGVkIGR1cmluZyB1cGRhdGVzLiBXaGlsZSBub3QgYmVpbmcKPiB1cGRhdGVkIGZyb20gdGhlIHNo
YWRvdyBidWZmZXIsIHRoZSBidWZmZXIgb2JqZWN0IGNhbiByZW1haW4gdW5tYXBwZWQuCj4gVXNl
cnNwYWNlIHdpbGwgYWx3YXlzIG1tYXAgdGhlIHNoYWRvdyBidWZmZXIuCj4gCj4gdjI6Cj4gCSog
Y2hhbmdlIERSTSBjbGllbnQgdG8gbm90IG1hcCBidWZmZXIgYnkgZGVmYXVsdAo+IAkqIG1hbnVh
bGx5IG1hcCBjbGllbnQgYnVmZmVyIGZvciBmYmRldiB3aXRoIEhXIGZyYW1lYnVmZmVyCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
LS0tCgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
