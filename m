Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 424263CCD2D
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 06:46:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA1A260647;
	Mon, 19 Jul 2021 04:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wYTEmQ-68m-B; Mon, 19 Jul 2021 04:46:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7EB5D605DB;
	Mon, 19 Jul 2021 04:46:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 096E1C0022;
	Mon, 19 Jul 2021 04:46:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F37B8C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 04:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0CBF40410
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 04:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="zp2HODPM";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="4Xq2C4ZW"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSqrhEfo9dcT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 04:46:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FDE24040F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 04:46:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D82DE201BC;
 Mon, 19 Jul 2021 04:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626669984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byI/6kuVm+w6U1j7g/ero6LHcS1QEQJ5HjyuaLKXYTw=;
 b=zp2HODPMvY4UOuXr2VCkq7iDuqoTVW5oIv4+faSGohoPaMHPWtaf/mH3qtSo+OsYwahbIe
 M+ihw3Rv8CKWGy2DZDzEw5licZTmH9lOuIkxt77W7Fmn+VBwTIx42n865ev0wvOaBD13ZI
 OTjfWsAhkf1WLO6P2PXZ5VJdPp1J7j0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626669984;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=byI/6kuVm+w6U1j7g/ero6LHcS1QEQJ5HjyuaLKXYTw=;
 b=4Xq2C4ZWrQc4ujCyuZOqvVLbJnugnOv1/6aduFZI1we2XaYilIRnVfyqqlldouKPotebSd
 y30pk6T9ibtBxfDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D056013C8C;
 Mon, 19 Jul 2021 04:46:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LlWgMqAD9WAbYwAAMHmgww
 (envelope-from <lma@suse.de>); Mon, 19 Jul 2021 04:46:24 +0000
MIME-Version: 1.0
Date: Mon, 19 Jul 2021 04:46:24 +0000
From: lma <lma@suse.de>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [Question] virtio-net: About napi_tx
In-Reply-To: <CA+FuTSeTC3cU7YrBv4wgTXM9s+2NjiHAgTJaKVHnYFk3=0aDFw@mail.gmail.com>
References: <c94e89f8ba97b4ac66f8fca35eb2f0ba@suse.de>
 <CA+FuTSeTC3cU7YrBv4wgTXM9s+2NjiHAgTJaKVHnYFk3=0aDFw@mail.gmail.com>
User-Agent: Roundcube Webmail
Message-ID: <182b4f84d2b83d1c6b0d018ccb57f61c@suse.de>
X-Sender: lma@suse.de
Cc: virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

5ZyoIDIwMjEtMDctMTMgMDc6NTLvvIxXaWxsZW0gZGUgQnJ1aWpuIOWGmemBk++8mgo+IE9uIFR1
ZSwgSnVsIDEzLCAyMDIxIGF0IDM6MDQgQU0gbG1hIDxsbWFAc3VzZS5kZT4gd3JvdGU6Cj4+IAo+
PiBIaSBXaWxsZW0gYW5kIGxpc3QsCj4+IAo+PiBUaGUgbmFwaV90eCBvZiB2aXJ0aW9fbmV0IGlz
IGVuYWJsZWQgYnkgZGVmYXVsdCBieSBjb21taXQgMzFjMDNhZWYuCj4+IAo+PiBhbmQgdGhlIGNv
bW1pdCBtZXNzYWdlIG1lbnRpb25lZDoKPj4gICAgICBJbiB0aGUgdW5saWtlbHkgY2FzZSBvZiBy
ZWdyZXNzaW9uLCB3ZSBoYXZlIGxhbmRlZCBhIGNyZWRpYmxlCj4+IHJ1bnRpbWUKPj4gICAgICBz
b2x1dGlvbi4gRXRodG9vbCBjYW4gY29uZmlndXJlIGl0IHdpdGggLUMgdHgtZnJhbWVzIFswfDFd
IGFzIG9mCj4+ICAgICAgY29tbWl0IDBjNDY1YmUxODNjNyAoInZpcnRpb19uZXQ6IGV0aHRvb2wg
dHggbmFwaSAKPj4gY29uZmlndXJhdGlvbiIpLgo+PiAKPj4gSSdkIGxpa2UgdG8ga25vdyBtb3Jl
IGFib3V0ICJ0aGUgdW5saWtlbHkgY2FzZSBvZiByZWdyZXNzaW9uIi4KPj4gSXMgaXQgd29ya2xv
YWRzIHJlbGF0ZWQgb3IgYmFyZSBtZXRhbCBoYXJkd2FyZSByZWxhdGVkPwo+IAo+IFRoZXJlIGFy
ZSBubyBzcGVjaWZpYyBrbm93biBjYXNlcy4gVGhpcyBpcyBhIHByZWNhdXRpb24gaWYgYSB1c2Vy
Cj4gZGlzY292ZXJzIGEgcmVncmVzc2lvbi4KClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLApM
aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
