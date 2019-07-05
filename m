Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D366031A
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 11:27:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42BB3114A;
	Fri,  5 Jul 2019 09:26:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 022B81141
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 72EE470D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:26:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 826AFAF3E;
	Fri,  5 Jul 2019 09:26:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
	sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
	yc_chen@aspeedtech.com
Subject: [PATCH v2 5/6] drm/bochs: Use shadow buffer for bochs framebuffer
	console
Date: Fri,  5 Jul 2019 11:26:12 +0200
Message-Id: <20190705092613.7621-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705092613.7621-1-tzimmermann@suse.de>
References: <20190705092613.7621-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
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

VGhlIGJvY2hzIGRyaXZlciAoYW5kIHZpcnR1YWwgaGFyZHdhcmUpIHJlcXVpcmVzIGJ1ZmZlciBv
YmplY3RzIHRvCnJlc2lkZSBpbiB2aWRlbyByYW0gdG8gZGlzcGxheSB0aGVtIHRvIHRoZSBzY3Jl
ZW4uIFNvIGl0IGNhbiBub3QKZGlzcGxheSB0aGUgZnJhbWVidWZmZXIgY29uc29sZSBiZWNhdXNl
IHRoZSByZXNwZWN0aXZlIGJ1ZmZlciBvYmplY3QKaXMgcGVybWFuZW50bHkgcGlubmVkIGluIHN5
c3RlbSBtZW1vcnkuCgpVc2luZyBhIHNoYWRvdyBidWZmZXIgZm9yIHRoZSBjb25zb2xlIHNvbHZl
cyB0aGlzIHByb2JsZW0uIFRoZSBjb25zb2xlCmVtdWxhdGlvbiB3aWxsIHBpbiB0aGUgYnVmZmVy
IG9iamVjdCBvbmx5IGR1cmluZyB1cGRhdGVzIGZyb20gdGhlIHNoYWRvdwpidWZmZXIuIE90aGVy
d2lzZSwgdGhlIGJvY2hzIGRyaXZlciBjYW4gZnJlZWx5IHJlbG9jYXRlZCB0aGUgYnVmZmVyCmJl
dHdlZW4gc3lzdGVtIG1lbW9yeSBhbmQgdmlkZW8gcmFtLgoKdjI6CgkqIHNlbGVjdCBzaGFkb3cg
RkIgdmlhIHN0cnVjdCBkcm1fbW9kZV9jb25maWcucHJlZmVyX3NoYWRvd19mYmRldgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkFja2VkLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfa21zLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYwppbmRleCBiYzE5ZGJkNTMxZWYuLjM1OTAzMGQ1
ZDgxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYwpAQCAtMTkxLDYgKzE5MSw3IEBAIGlu
dCBib2Noc19rbXNfaW5pdChzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocykKIAlib2Nocy0+ZGV2
LT5tb2RlX2NvbmZpZy5mYl9iYXNlID0gYm9jaHMtPmZiX2Jhc2U7CiAJYm9jaHMtPmRldi0+bW9k
ZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMjQ7CiAJYm9jaHMtPmRldi0+bW9kZV9jb25maWcu
cHJlZmVyX3NoYWRvdyA9IDA7CisJYm9jaHMtPmRldi0+bW9kZV9jb25maWcucHJlZmVyX3NoYWRv
d19mYmRldiA9IDE7CiAJYm9jaHMtPmRldi0+bW9kZV9jb25maWcucXVpcmtfYWRkZmJfcHJlZmVy
X2hvc3RfYnl0ZV9vcmRlciA9IHRydWU7CiAKIAlib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5mdW5j
cyA9ICZib2Noc19tb2RlX2Z1bmNzOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
