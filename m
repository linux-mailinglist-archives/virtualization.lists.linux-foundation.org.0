Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96554DAE8
	for <lists.virtualization@lfdr.de>; Thu, 16 Jun 2022 08:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE71C419E7;
	Thu, 16 Jun 2022 06:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UIRuFFuzRBm; Thu, 16 Jun 2022 06:42:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D131041892;
	Thu, 16 Jun 2022 06:42:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D874C002D;
	Thu, 16 Jun 2022 06:42:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56FE0C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 06:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38398606FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 06:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erbWAnH3aWuL
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 06:42:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F0BE60008
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655361751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hKBsqqF9iM7wCkQHKkjJhfnlmx1MpDb85k4E3ksF7E=;
 b=cqB4nPhaJV2iy3CNAH1z7KnBVaH5CLMuWE3wK0UKaC283CF61xIerUULl4f4mYiCYh4ikz
 eH8W7EUv5j8XK21ByEwHfmmrg/SrPXGuhMWCGPst5BJxC0NZwuz+VD0RvZBno0dmIt4RZ2
 qprCMfqT4BDPDqG0MzXFtk4ITuxZ6ow=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-aT2Fbf6OPQKrdMCVDHQ0fQ-1; Thu, 16 Jun 2022 02:42:29 -0400
X-MC-Unique: aT2Fbf6OPQKrdMCVDHQ0fQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so46343wra.15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jun 2022 23:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5hKBsqqF9iM7wCkQHKkjJhfnlmx1MpDb85k4E3ksF7E=;
 b=JmwVmJ81Wc2Lfdogp+Pwu49hk/rZK7Hmv2aG9IstzsWwJeP0dWp5rfYH6bNtbKfZuR
 KS+qHog77jYowGejw5G8RhAk53/nRVbz/pXWWmrO6/TC67t1dr7bRKyoueHJY6yHh8KF
 SGycoPLTNW3RZdRSGeXTIK5qLNdF1jFwgFm1jnXuLwm3aALFQef89HkChFvUdN2L1c7l
 Vj7B8JXlekehWEXx0pVE10ZoW7IDXTgAbA9RhAUsCb82DdEsJdJSVTke80oo+o+Lx3go
 0b4QVRqiznbX8nxm0ZNXVpt3UrzewvZL2dGBhPt+EZpcvYBGPC8IqDXOwo/ySlxE+8hW
 z7KQ==
X-Gm-Message-State: AOAM532kyoK9S9krUQCQvLe7CY7sBO4tV/XGcCKBK0p2u/c/CYojAg1+
 8bRQeY35UTgK2mL34v7uz6saf5l1hgX0jC+D2CakyTTgBwWDt54GZX5NU3jCpTCQSCV6phGdAYK
 Qwf030k5yJcYSKSjBKJFDXthG/6FMrivD0roPmZA/vA==
X-Received: by 2002:a7b:cd16:0:b0:39c:4fff:88cc with SMTP id
 f22-20020a7bcd16000000b0039c4fff88ccmr13564760wmj.122.1655361748309; 
 Wed, 15 Jun 2022 23:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhbOPd8VRoXb4skZki7wrmCRjEAVTwkgPiOKOCqccbZNh39gvdtqOded3/KjKHMKlAZkQbbg==
X-Received: by 2002:a7b:cd16:0:b0:39c:4fff:88cc with SMTP id
 f22-20020a7bcd16000000b0039c4fff88ccmr13564752wmj.122.1655361747969; 
 Wed, 15 Jun 2022 23:42:27 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107d:d500:e9ae:3150:6c35:ac38])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d5641000000b0021108003596sm932162wrw.10.2022.06.15.23.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 23:42:27 -0700 (PDT)
Date: Thu, 16 Jun 2022 02:42:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Huang <huangjie.albert@bytedance.com>
Subject: Re: [PATCH v2] virtio_ring : keep used_wrap_counter in
 vq->last_used_idx
Message-ID: <20220616024148-mutt-send-email-mst@kernel.org>
References: <CACGkMEtz-1=3=+zUZvc+CX4LrufZZfZO=_zONo5GuAUX+BrpAQ@mail.gmail.com>
 <20220616051221.28506-1-huangjie.albert@bytedance.com>
 <20220616015331-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220616015331-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, yuanzhu@bytedance.com,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMDI6MDc6MTlBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFRodSwgSnVuIDE2LCAyMDIyIGF0IDAxOjEyOjIxUE0gKzA4MDAsIEFs
YmVydCBIdWFuZyB3cm90ZToKPiA+IEZyb206ICJodWFuZ2ppZS5hbGJlcnQiIDxodWFuZ2ppZS5h
bGJlcnRAYnl0ZWRhbmNlLmNvbT4KPiA+IAo+ID4gdGhlIHVzZWRfd3JhcF9jb3VudGVyIGFuZCB0
aGUgdnEtPmxhc3RfdXNlZF9pZHggbWF5IGdldAo+ID4gb3V0IG9mIHN5bmMgaWYgdGhleSBhcmUg
c2VwYXJhdGUgYXNzaWdubWVudO+8jGFuZCBpbnRlcnJ1cHQKPiA+IG1pZ2h0IHVzZSBhbiBpbmNv
cnJlY3QgdmFsdWUgdG8gY2hlY2sgZm9yIHRoZSB1c2VkIGluZGV4Lgo+ID4gCj4gPiBmb3IgZXhh
bXBsZTpPT0IgYWNjZXNzCj4gPiBrc29mdGlycWQgbWF5IGNvbnN1bWUgdGhlIHBhY2tldCBhbmQg
aXQgd2lsbCBjYWxsOgo+ID4gdmlydG5ldF9wb2xsCj4gPiAJLS0+dmlydG5ldF9yZWNlaXZlCj4g
PiAJCS0tPnZpcnRxdWV1ZV9nZXRfYnVmX2N0eAo+ID4gCQkJLS0+dmlydHF1ZXVlX2dldF9idWZf
Y3R4X3BhY2tlZAo+ID4gYW5kIGluIHZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQ6Cj4gPiAK
PiA+IHZxLT5sYXN0X3VzZWRfaWR4ICs9IHZxLT5wYWNrZWQuZGVzY19zdGF0ZVtpZF0ubnVtOwo+
ID4gaWYgKHVubGlrZWx5KHZxLT5sYXN0X3VzZWRfaWR4ID49IHZxLT5wYWNrZWQudnJpbmcubnVt
KSkgewo+ID4gICAgICAgICAgdnEtPmxhc3RfdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5u
dW07Cj4gPiAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gPiB9
Cj4gPiAKPiA+IGlmIGF0IHRoZSBzYW1lIHRpbWUsIHRoZXJlIGNvbWVzIGEgdnJpbmcgaW50ZXJy
dXB077yMaW4gdnJpbmdfaW50ZXJydXB0Ogo+ID4gd2Ugd2lsbCBjYWxsOgo+ID4gdnJpbmdfaW50
ZXJydXB0Cj4gPiAJLS0+bW9yZV91c2VkCj4gPiAJCS0tPm1vcmVfdXNlZF9wYWNrZWQKPiA+IAkJ
CS0tPmlzX3VzZWRfZGVzY19wYWNrZWQKPiA+IGluIGlzX3VzZWRfZGVzY19wYWNrZWQsIHRoZSBs
YXN0X3VzZWRfaWR4IG1heWJlID49IHZxLT5wYWNrZWQudnJpbmcubnVtLgo+ID4gc28gdGhpcyBj
b3VsZCBjYXNlIGEgbWVtb3J5IG91dCBvZiBib3VuZHMgYnVnLgo+ID4gCj4gPiB0aGlzIHBhdGNo
IGlzIHRvIGtlZXAgdGhlIHVzZWRfd3JhcF9jb3VudGVyIGluIHZxLT5sYXN0X3VzZWRfaWR4Cj4g
PiBzbyB3ZSBjYW4gZ2V0IHRoZSBjb3JyZWN0IHZhbHVlIHRvIGNoZWNrIGZvciB1c2VkIGluZGV4
IGluIGludGVycnVwdC4KPiA+IAo+ID4gdjEtPnYyOgo+ID4gLSByZXVzZSB0aGUgVlJJTkdfUEFD
S0VEX0VWRU5UX0ZfV1JBUF9DVFIKPiA+IC0gUmVtb3ZlIHBhcmFtZXRlciBqdWRnbWVudCBpbiBp
c191c2VkX2Rlc2NfcGFja2VkLAo+ID4gYmVjYXVzZSBpdCBjYW4ndCBiZSBpbGxlZ2FsCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IGh1YW5namllLmFsYmVydCA8aHVhbmdqaWUuYWxiZXJ0QGJ5dGVk
YW5jZS5jb20+Cj4gCj4gCj4gVGhpcyBsb29rcyBnb29kLCBqdXN0IGEgc21hbGwgc3VnZ2VzdGlv
biBiZWxvdzoKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgfCA1
NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jp
bmcuYwo+ID4gaW5kZXggMTNhNzM0OGNlZGZmLi5iMjJkOTdjOWE3NTUgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92
aXJ0aW9fcmluZy5jCj4gPiBAQCAtMTExLDcgKzExMSwxMiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1
ZXVlIHsKPiA+ICAJLyogTnVtYmVyIHdlJ3ZlIGFkZGVkIHNpbmNlIGxhc3Qgc3luYy4gKi8KPiA+
ICAJdW5zaWduZWQgaW50IG51bV9hZGRlZDsKPiA+ICAKPiA+IC0JLyogTGFzdCB1c2VkIGluZGV4
IHdlJ3ZlIHNlZW4uICovCj4gPiArCS8qIExhc3QgdXNlZCBpbmRleCAgd2UndmUgc2Vlbi4KPiA+
ICsJICogZm9yIHNwbGl0IHJpbmcsIGl0IGp1c3QgY29udGFpbnMgbGFzdCB1c2VkIGluZGV4Cj4g
PiArCSAqIGZvciBwYWNrZWQgcmluZywgaXQgbm90IG9ubHkgY29udGFpbnMgbGFzdCB1c2VkIGlu
ZGV4LCBidXQgYWxzbwo+ID4gKwkgKiB1c2VkX3dyYXBfY291bnRlciwgdGhlIFZSSU5HX1BBQ0tF
RF9FVkVOVF9GX1dSQVBfQ1RSIGlzCj4gPiArCSAqIHRoZSBiaXQgc2hpZnQgaW4gbGFzdF91c2Vk
X2lkeAo+ID4gKwkgKi8KPiA+ICAJdTE2IGxhc3RfdXNlZF9pZHg7Cj4gPiAgCj4gPiAgCS8qIEhp
bnQgZm9yIGV2ZW50IGlkeDogYWxyZWFkeSB0cmlnZ2VyZWQgbm8gbmVlZCB0byBkaXNhYmxlLiAq
Lwo+ID4gQEAgLTE1NCw5ICsxNTksNiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlIHsKPiA+ICAJ
CQkvKiBEcml2ZXIgcmluZyB3cmFwIGNvdW50ZXIuICovCj4gPiAgCQkJYm9vbCBhdmFpbF93cmFw
X2NvdW50ZXI7Cj4gPiAgCj4gPiAtCQkJLyogRGV2aWNlIHJpbmcgd3JhcCBjb3VudGVyLiAqLwo+
ID4gLQkJCWJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4gPiAtCj4gPiAgCQkJLyogQXZhaWwgdXNl
ZCBmbGFncy4gKi8KPiA+ICAJCQl1MTYgYXZhaWxfdXNlZF9mbGFnczsKPiA+ICAKPiA+IEBAIC0x
NDA2LDggKzE0MDgsMTIgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3VzZWRfZGVzY19wYWNrZWQo
Y29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4gPiAgCj4gPiAgc3RhdGljIGlubGlu
ZSBib29sIG1vcmVfdXNlZF9wYWNrZWQoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEp
Cj4gPiAgewo+ID4gLQlyZXR1cm4gaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgdnEtPmxhc3RfdXNl
ZF9pZHgsCj4gPiAtCQkJdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlcik7Cj4gPiArCXUxNiBs
YXN0X3VzZWQ7Cj4gPiArCWJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4gPiArCj4gPiArCWxhc3Rf
dXNlZCA9IHZxLT5sYXN0X3VzZWRfaWR4ICYgfigxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dS
QVBfQ1RSKTsKPiAKPiBUaGlzIG9ubHkgd29ya3MgaWYgbGFzdF91c2VkX2lkeCBpcyAxNiBiaXQg
YW5kCj4gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIgaXMgMTUuCj4gCj4gSSB0aGluayB5
b3Ugd2FudCAKPiAvKiBhbGwgYml0cyBiZWxvdyBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NU
UiAqLwo+IHZxLT5sYXN0X3VzZWRfaWR4ICYgfigtKDEgPDwgVlJJTkdfUEFDS0VEX0VWRU5UX0Zf
V1JBUF9DVFIpKTsKPiAKPiAKPiA+ICsJdXNlZF93cmFwX2NvdW50ZXIgPSAhISgodnEtPmxhc3Rf
dXNlZF9pZHgpID4+IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKTsKPiAKPiAKPiBBIGJp
dCBtb3JlIGVmZmljaWVudCBhbmQgY2xlYXI6Cj4gCj4gISEocS0+bGFzdF91c2VkX2lkeCAmICgx
IDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKSkKPiAKPiAKPiAKPiBBbHNvIHRoaXMg
bG9naWMgaXMgcmVwZWF0ZWQgaW4gbXVsdGlwbGUgcGxhY2VzLiBMZXQncyBhZGQgYSBjb3VwbGUg
b2YgaW5saW5lCj4gZnVuY3Rpb25zOgo+IAo+IHN0YXRpYyBpbmxpbmUgYm9vbCBwYWNrZWRfdXNl
ZF93cmFwX2NvdW50ZXIodnEpCj4gCj4gc3RhdGljIGlubGluZSB1MTYgcGFja2VkX2xhc3RfdXNl
ZCh2cSkKCk9yIGJldHRlcjoKCnBhY2tlZF91c2VkX3dyYXBfY291bnRlcih1MTYgbGFzdF91c2Vk
X2lkeCkKcGFja2VkX2xhc3RfdXNlZCh1MTYgbGFzdF91c2VkX2lkeCkKCgo+IHRoZW4gdXNlIHRo
ZXNlIGV2ZXJ5d2hlcmUuCj4gCj4gCj4gPiArCXJldHVybiBpc191c2VkX2Rlc2NfcGFja2VkKHZx
LCBsYXN0X3VzZWQsIHVzZWRfd3JhcF9jb3VudGVyKTsKPiA+ICB9Cj4gPiAgCj4gPiAgc3RhdGlj
IHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3Zx
LAo+ID4gQEAgLTE0MTYsNiArMTQyMiw3IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1
Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ICB7Cj4gPiAgCXN0cnVjdCB2
cmluZ192aXJ0cXVldWUgKnZxID0gdG9fdnZxKF92cSk7Cj4gPiAgCXUxNiBsYXN0X3VzZWQsIGlk
Owo+ID4gKwlib29sIHVzZWRfd3JhcF9jb3VudGVyOwo+ID4gIAl2b2lkICpyZXQ7Cj4gPiAgCj4g
PiAgCVNUQVJUX1VTRSh2cSk7Cj4gPiBAQCAtMTQzNCw3ICsxNDQxLDggQEAgc3RhdGljIHZvaWQg
KnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4g
IAkvKiBPbmx5IGdldCB1c2VkIGVsZW1lbnRzIGFmdGVyIHRoZXkgaGF2ZSBiZWVuIGV4cG9zZWQg
YnkgaG9zdC4gKi8KPiA+ICAJdmlydGlvX3JtYih2cS0+d2Vha19iYXJyaWVycyk7Cj4gPiAgCj4g
PiAtCWxhc3RfdXNlZCA9IHZxLT5sYXN0X3VzZWRfaWR4Owo+ID4gKwl1c2VkX3dyYXBfY291bnRl
ciA9ICEhKCh2cS0+bGFzdF91c2VkX2lkeCA+PiBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NU
UikpOwo+ID4gKwlsYXN0X3VzZWQgPSAodnEtPmxhc3RfdXNlZF9pZHgpICYgKH4oMSA8PCBWUklO
R19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUikpOwo+ID4gIAlpZCA9IGxlMTZfdG9fY3B1KHZxLT5w
YWNrZWQudnJpbmcuZGVzY1tsYXN0X3VzZWRdLmlkKTsKPiA+ICAJKmxlbiA9IGxlMzJfdG9fY3B1
KHZxLT5wYWNrZWQudnJpbmcuZGVzY1tsYXN0X3VzZWRdLmxlbik7Cj4gPiAgCj4gPiBAQCAtMTQ1
MSwxMiArMTQ1OSwxNSBAQCBzdGF0aWMgdm9pZCAqdmlydHF1ZXVlX2dldF9idWZfY3R4X3BhY2tl
ZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiAgCXJldCA9IHZxLT5wYWNrZWQuZGVzY19zdGF0
ZVtpZF0uZGF0YTsKPiA+ICAJZGV0YWNoX2J1Zl9wYWNrZWQodnEsIGlkLCBjdHgpOwo+ID4gIAo+
ID4gLQl2cS0+bGFzdF91c2VkX2lkeCArPSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRdLm51bTsK
PiA+IC0JaWYgKHVubGlrZWx5KHZxLT5sYXN0X3VzZWRfaWR4ID49IHZxLT5wYWNrZWQudnJpbmcu
bnVtKSkgewo+ID4gLQkJdnEtPmxhc3RfdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5udW07
Cj4gPiAtCQl2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gPiArCWxhc3RfdXNl
ZCArPSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRdLm51bTsKPiA+ICsJaWYgKHVubGlrZWx5KGxh
c3RfdXNlZCA+PSB2cS0+cGFja2VkLnZyaW5nLm51bSkpIHsKPiA+ICsJCWxhc3RfdXNlZCAtPSB2
cS0+cGFja2VkLnZyaW5nLm51bTsKPiA+ICsJCXVzZWRfd3JhcF9jb3VudGVyIF49IDE7Cj4gPiAg
CX0KPiA+ICAKPiA+ICsJbGFzdF91c2VkID0gKGxhc3RfdXNlZCB8ICh1c2VkX3dyYXBfY291bnRl
ciA8PCBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUikpOwo+ID4gKwl2cS0+bGFzdF91c2Vk
X2lkeCA9IGxhc3RfdXNlZDsKPiA+ICsKPiA+ICAJLyoKPiA+ICAJICogSWYgd2UgZXhwZWN0IGFu
IGludGVycnVwdCBmb3IgdGhlIG5leHQgZW50cnksIHRlbGwgaG9zdAo+ID4gIAkgKiBieSB3cml0
aW5nIGV2ZW50IGluZGV4IGFuZCBmbHVzaCBvdXQgdGhlIHdyaXRlIGJlZm9yZQo+ID4gQEAgLTE0
NjUsOSArMTQ3Niw3IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2Vk
KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ICAJaWYgKHZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nf
c2hhZG93ID09IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RFU0MpCj4gPiAgCQl2aXJ0aW9fc3Rv
cmVfbWIodnEtPndlYWtfYmFycmllcnMsCj4gPiAgCQkJCSZ2cS0+cGFja2VkLnZyaW5nLmRyaXZl
ci0+b2ZmX3dyYXAsCj4gPiAtCQkJCWNwdV90b19sZTE2KHZxLT5sYXN0X3VzZWRfaWR4IHwKPiA+
IC0JCQkJCSh2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIDw8Cj4gPiAtCQkJCQkgVlJJTkdf
UEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKSk7Cj4gPiArCQkJCWNwdV90b19sZTE2KHZxLT5sYXN0
X3VzZWRfaWR4KSk7Cj4gPiAgCj4gPiAgCUxBU1RfQUREX1RJTUVfSU5WQUxJRCh2cSk7Cj4gPiAg
Cj4gPiBAQCAtMTQ5OSw5ICsxNTA4LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2aXJ0cXVldWVf
ZW5hYmxlX2NiX3ByZXBhcmVfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+ICAKPiA+
ICAJaWYgKHZxLT5ldmVudCkgewo+ID4gIAkJdnEtPnBhY2tlZC52cmluZy5kcml2ZXItPm9mZl93
cmFwID0KPiA+IC0JCQljcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCB8Cj4gPiAtCQkJCSh2
cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIDw8Cj4gPiAtCQkJCSBWUklOR19QQUNLRURfRVZF
TlRfRl9XUkFQX0NUUikpOwo+ID4gKwkJCWNwdV90b19sZTE2KHZxLT5sYXN0X3VzZWRfaWR4KTsK
PiA+ICAJCS8qCj4gPiAgCQkgKiBXZSBuZWVkIHRvIHVwZGF0ZSBldmVudCBvZmZzZXQgYW5kIGV2
ZW50IHdyYXAKPiA+ICAJCSAqIGNvdW50ZXIgZmlyc3QgYmVmb3JlIHVwZGF0aW5nIGV2ZW50IGZs
YWdzLgo+ID4gQEAgLTE1MTgsOCArMTUyNSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgdmlydHF1
ZXVlX2VuYWJsZV9jYl9wcmVwYXJlX3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gPiAg
CX0KPiA+ICAKPiA+ICAJRU5EX1VTRSh2cSk7Cj4gPiAtCXJldHVybiB2cS0+bGFzdF91c2VkX2lk
eCB8ICgodTE2KXZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIgPDwKPiA+IC0JCQlWUklOR19Q
QUNLRURfRVZFTlRfRl9XUkFQX0NUUik7Cj4gPiArCXJldHVybiB2cS0+bGFzdF91c2VkX2lkeDsK
PiA+ICB9Cj4gPiAgCj4gPiAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX3BvbGxfcGFja2VkKHN0cnVj
dCB2aXJ0cXVldWUgKl92cSwgdTE2IG9mZl93cmFwKQo+ID4gQEAgLTE1NTAsOSArMTU1Niw5IEBA
IHN0YXRpYyBib29sIHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3RydWN0IHZp
cnRxdWV1ZSAqX3ZxKQo+ID4gIAlpZiAodnEtPmV2ZW50KSB7Cj4gPiAgCQkvKiBUT0RPOiB0dW5l
IHRoaXMgdGhyZXNob2xkICovCj4gPiAgCQlidWZzID0gKHZxLT5wYWNrZWQudnJpbmcubnVtIC0g
dnEtPnZxLm51bV9mcmVlKSAqIDMgLyA0Owo+ID4gLQkJd3JhcF9jb3VudGVyID0gdnEtPnBhY2tl
ZC51c2VkX3dyYXBfY291bnRlcjsKPiA+ICsJCXdyYXBfY291bnRlciA9ICEhKHZxLT5sYXN0X3Vz
ZWRfaWR4ID4+IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKTsKPiA+ICAKPiA+IC0JCXVz
ZWRfaWR4ID0gdnEtPmxhc3RfdXNlZF9pZHggKyBidWZzOwo+ID4gKwkJdXNlZF9pZHggPSAodnEt
Pmxhc3RfdXNlZF9pZHggJiB+KDEgPDwgVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKSAr
IGJ1ZnM7Cj4gPiAgCQlpZiAodXNlZF9pZHggPj0gdnEtPnBhY2tlZC52cmluZy5udW0pIHsKPiA+
ICAJCQl1c2VkX2lkeCAtPSB2cS0+cGFja2VkLnZyaW5nLm51bTsKPiA+ICAJCQl3cmFwX2NvdW50
ZXIgXj0gMTsKPiA+IEBAIC0xNTgyLDkgKzE1ODgsOSBAQCBzdGF0aWMgYm9vbCB2aXJ0cXVldWVf
ZW5hYmxlX2NiX2RlbGF5ZWRfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+ICAJICov
Cj4gPiAgCXZpcnRpb19tYih2cS0+d2Vha19iYXJyaWVycyk7Cj4gPiAgCj4gPiAtCWlmIChpc191
c2VkX2Rlc2NfcGFja2VkKHZxLAo+ID4gLQkJCQl2cS0+bGFzdF91c2VkX2lkeCwKPiA+IC0JCQkJ
dnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlcikpIHsKPiA+ICsJd3JhcF9jb3VudGVyID0gISEo
dnEtPmxhc3RfdXNlZF9pZHggPj4gVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpOwo+ID4g
Kwl1c2VkX2lkeCA9ICh2cS0+bGFzdF91c2VkX2lkeCAmIH4oMSA8PCBWUklOR19QQUNLRURfRVZF
TlRfRl9XUkFQX0NUUikpOwo+ID4gKwlpZiAoaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgdXNlZF9p
ZHgsIHdyYXBfY291bnRlcikpIHsKPiA+ICAJCUVORF9VU0UodnEpOwo+ID4gIAkJcmV0dXJuIGZh
bHNlOwo+ID4gIAl9Cj4gPiBAQCAtMTY4OSw3ICsxNjk1LDcgQEAgc3RhdGljIHN0cnVjdCB2aXJ0
cXVldWUgKnZyaW5nX2NyZWF0ZV92aXJ0cXVldWVfcGFja2VkKAo+ID4gIAl2cS0+bm90aWZ5ID0g
bm90aWZ5Owo+ID4gIAl2cS0+d2Vha19iYXJyaWVycyA9IHdlYWtfYmFycmllcnM7Cj4gPiAgCXZx
LT5icm9rZW4gPSB0cnVlOwo+ID4gLQl2cS0+bGFzdF91c2VkX2lkeCA9IDA7Cj4gPiArCXZxLT5s
YXN0X3VzZWRfaWR4ID0gMCB8ICgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSKTsK
PiA+ICAJdnEtPmV2ZW50X3RyaWdnZXJlZCA9IGZhbHNlOwo+ID4gIAl2cS0+bnVtX2FkZGVkID0g
MDsKPiA+ICAJdnEtPnBhY2tlZF9yaW5nID0gdHJ1ZTsKPiA+IEBAIC0xNzIwLDcgKzE3MjYsNiBA
QCBzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnJpbmdfY3JlYXRlX3ZpcnRxdWV1ZV9wYWNrZWQo
Cj4gPiAgCj4gPiAgCXZxLT5wYWNrZWQubmV4dF9hdmFpbF9pZHggPSAwOwo+ID4gIAl2cS0+cGFj
a2VkLmF2YWlsX3dyYXBfY291bnRlciA9IDE7Cj4gPiAtCXZxLT5wYWNrZWQudXNlZF93cmFwX2Nv
dW50ZXIgPSAxOwo+ID4gIAl2cS0+cGFja2VkLmV2ZW50X2ZsYWdzX3NoYWRvdyA9IDA7Cj4gPiAg
CXZxLT5wYWNrZWQuYXZhaWxfdXNlZF9mbGFncyA9IDEgPDwgVlJJTkdfUEFDS0VEX0RFU0NfRl9B
VkFJTDsKPiA+ICAKPiA+IC0tIAo+ID4gMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
