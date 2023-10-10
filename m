Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF47BF309
	for <lists.virtualization@lfdr.de>; Tue, 10 Oct 2023 08:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9665881586;
	Tue, 10 Oct 2023 06:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9665881586
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fv/+1kMI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vl0-N52cqO-g; Tue, 10 Oct 2023 06:30:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1C1A78148D;
	Tue, 10 Oct 2023 06:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C1A78148D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46616C0DD3;
	Tue, 10 Oct 2023 06:30:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C0EBC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70450403AC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70450403AC
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fv/+1kMI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjCnBJHXqbyp
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:30:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE03540232
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE03540232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696919402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gkyhygrn0LjKBs+Gy+HOQR/ROK9i9+TCjbjoKrbTIPI=;
 b=Fv/+1kMIc6OwI1a9QpbPa8eFL1Db4c9p/JfOiYHnbrqeqjzZT6R1B9eU5W9cw1nD90l6Q4
 dG4e3Zt8gn1TjeewT649P1ftfdyH1qi1tsYvqJ57wKcTDviVUnIA/njCaJtTGNUg9OPM9f
 TTIl9DV/DCenQulGhwHsAWNDN41vTcs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-4Ql0XSMaPZuwzhgX7460dg-1; Tue, 10 Oct 2023 02:30:01 -0400
X-MC-Unique: 4Ql0XSMaPZuwzhgX7460dg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2c2b9eb8e26so45143521fa.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Oct 2023 23:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696919400; x=1697524200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gkyhygrn0LjKBs+Gy+HOQR/ROK9i9+TCjbjoKrbTIPI=;
 b=A6gNZ4sZz9tUMsVGyVKQHIUkSVM/cUxK9qEQDpuNT5DyaQGyFhuG7MQcrbygCd/f+K
 qv4QW0iONCorar85TIuP2W+KT+LjvjhxvSmeFbzgyaIFzBPJ+efOhASiKNNUDQGK9Sqd
 R0jt81r0zc27U9IccYPFa886FAzTZXHujVeTMeO6itA5sh+ReY+czl2RPH2fXHnlKePR
 iVQU6ms7/jtx9dIw5U9LRMJ96kGNsByhB9r8aAaJoKV//z+5wmOSccfQ8EVQTNvGjlas
 NUNDo02lGNqg6sbNgCETHuyqaPA4HYZrmYsbb1qqq51kObWPixU1y1+6ckSDgCwvsYfq
 eCxw==
X-Gm-Message-State: AOJu0YwEZe9Ivq4uvC5tAHNesYcDI0Hv0A2JEn0A4pwKUsIqoYXTwD/5
 NlpA2vsVpEcJcGoSwyDvxl7An/ZLF3uTsnnmWjaJMom7/dWexOskPz7o3ZhEUmmPsAjG6QoBLS2
 4RxwVp17BIUowHIATVHpECalKiCQGKvy7VoBztKeiKl/lZEXonNUdQJ0H0Q==
X-Received: by 2002:a05:6512:3444:b0:504:7cc6:1ad7 with SMTP id
 j4-20020a056512344400b005047cc61ad7mr14922269lfr.1.1696919399898; 
 Mon, 09 Oct 2023 23:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhwDe3FDKZFhiwrOl5KVXL4P0qXDeJGMy+/g0KGSF4lR/hfI+JvoID/birDGa8k73PyhD9Jc/VWYdZ2/MiwBc=
X-Received: by 2002:a05:6512:3444:b0:504:7cc6:1ad7 with SMTP id
 j4-20020a056512344400b005047cc61ad7mr14922251lfr.1.1696919399537; Mon, 09 Oct
 2023 23:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231009112401.1060447-1-dtatulea@nvidia.com>
 <20231009112401.1060447-13-dtatulea@nvidia.com>
In-Reply-To: <20231009112401.1060447-13-dtatulea@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 Oct 2023 14:29:48 +0800
Message-ID: <CACGkMEseT3P6s6XC4+=7LMrBtP_uG5q6oXDjTtkX_N8u2D0SVQ@mail.gmail.com>
Subject: Re: [PATCH vhost v3 12/16] vdpa/mlx5: Improve mr update flow
To: Dragos Tatulea <dtatulea@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Eugenio Perez Martin <eperezma@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>
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

T24gTW9uLCBPY3QgOSwgMjAyMyBhdCA3OjI14oCvUE0gRHJhZ29zIFRhdHVsZWEgPGR0YXR1bGVh
QG52aWRpYS5jb20+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgZmxvdyBmb3IgdXBkYXRpbmcgYW4g
bXIgd29ya3MgZGlyZWN0bHkgb24gbXZkZXYtPm1yIHdoaWNoCj4gbWFrZXMgaXQgY3VtYmVyc29t
ZSB0byBoYW5kbGUgbXVsdGlwbGUgbmV3IG1yIHN0cnVjdHMuCj4KPiBUaGlzIHBhdGNoIG1ha2Vz
IHRoZSBmbG93IG1vcmUgc3RyYWlnaHRmb3J3YXJkIGJ5IGhhdmluZwo+IG1seDVfdmRwYV9jcmVh
dGVfbXIgcmV0dXJuIGEgbmV3IG1yIHdoaWNoIHdpbGwgdXBkYXRlIHRoZSBvbGQgbXIgKGlmCj4g
YW55KS4gVGhlIG9sZCBtciB3aWxsIGJlIGRlbGV0ZWQgYW5kIHVubGlua2VkIGZyb20gbXZkZXYu
Cj4KPiBUaGlzIGNoYW5nZSBwYXZlcyB0aGUgd2F5IGZvciBhZGRpbmcgbXJzIGZvciBkaWZmZXJl
bnQgQVNJRHMuCj4KPiBUaGUgaW5pdGlhbGl6ZWQgYm9vbCBpcyBubyBsb25nZXIgbmVlZGVkIGFz
IG1yIGlzIG5vdyBhIHBvaW50ZXIgaW4gdGhlCj4gbWx4NV92ZHBhX2RldiBzdHJ1Y3Qgd2hpY2gg
d2lsbCBiZSBOVUxMIHdoZW4gbm90IGluaXRpYWxpemVkLgo+Cj4gQWNrZWQtYnk6IEV1Z2VuaW8g
UMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERyYWdvcyBUYXR1
bGVhIDxkdGF0dWxlYUBudmlkaWEuY29tPgo+IC0tLQoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
