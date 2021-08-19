Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB03F1505
	for <lists.virtualization@lfdr.de>; Thu, 19 Aug 2021 10:19:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC6D80B02;
	Thu, 19 Aug 2021 08:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_2VKV1GU40L; Thu, 19 Aug 2021 08:19:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EEA4880B9E;
	Thu, 19 Aug 2021 08:19:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D26FC000E;
	Thu, 19 Aug 2021 08:19:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 517FDC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 08:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 328C440578
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 08:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Js5KZu5K6fMN
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 08:19:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6061C402C6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629361155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vB7vMk6OHcToewBJPH+7GF9eDYwQGG+hfW5WnbyfL0M=;
 b=I9r/Y6UCrf15Kzq3kK8CKgge2yGPGnPdMXPm50l2mguerGa1j/PM5GC5PzzJcNENRMSISq
 1+KE0FUKmGerNuSjuIVuUlYdMtQL/WcV8e0lzbogZl2HsGWdbUlLq02miMj4i1BEx7ybi7
 qlHKopHyeyC6+O5mt7/NUmEhy/Mm9s0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-AALLPgO7MyayK-J6L--7MA-1; Thu, 19 Aug 2021 04:19:14 -0400
X-MC-Unique: AALLPgO7MyayK-J6L--7MA-1
Received: by mail-lf1-f70.google.com with SMTP id
 x3-20020a19e0030000b02903c25cedaef5so1692420lfg.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 01:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vB7vMk6OHcToewBJPH+7GF9eDYwQGG+hfW5WnbyfL0M=;
 b=d58SMXah6A0qVsU5NdzSJo1Du/LLZH6Er8kdBcfKcfoylEtSsfBqA1644TNuZ/jebu
 0liqljFWZpINdkr62IxL2A0Qi3GUJJK3ay8ONQ6Y9PKt+gZ2K7xkb/3Yz6Zk/+hzJMyt
 ckLDM8zNjqIf9e3SD2U1p2tgURUSfu6EBTX4/gEtqTznRcAGooEv53Yq5fadYeSA8a4J
 wiZN/EVWgWO5Hroa0aXJ3WR8ViRUkRSdd6Vk5F2bFGwEFvgXr8mUJVxjNTM2+VdLfLP/
 CM3vjIje/gDlUWL7cRHWbKjHEK3+4IGezoqwz7jxYyg5FyqqLTPKDaKGQqWOPk/tBJR+
 1qbQ==
X-Gm-Message-State: AOAM530ZUeuvVnDUOiK2BEEA3qVUXEtSV1e9/2W1hb42tMTGpnbOfAlT
 DCb1fLmrImP9oxLcub/xLvnJdfp1+al2xTvgsecWszmG/I4e8+ldMqdvFUxZat1afIp+9NCLBT9
 aoAb7FEiAUtts01UOW0vZMi5feRYLdITORUEvafy6qP7KAExb+dm2v1laNQ==
X-Received: by 2002:a05:6512:4011:: with SMTP id
 br17mr9729177lfb.463.1629361152624; 
 Thu, 19 Aug 2021 01:19:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhQwrvkY4/AvnYB+y4sbiXHfXlf2qqcdffDnrPmi9oUpfLYvPUJxbF1j3Bzox8PcajQzHeDE4F1Bkwh2454i8=
X-Received: by 2002:a05:6512:4011:: with SMTP id
 br17mr9729163lfb.463.1629361152479; 
 Thu, 19 Aug 2021 01:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210817060250.188705-1-elic@nvidia.com>
 <20210817060250.188705-6-elic@nvidia.com>
 <92a8b0e6-7eba-8309-0c67-f526046573fc@redhat.com>
 <20210819060641.GA161591@mtl-vdi-166.wap.labs.mlnx>
 <b2aada9a-7cea-93aa-dc22-349968e8b2eb@redhat.com>
 <20210819072145.GA166182@mtl-vdi-166.wap.labs.mlnx>
 <20210819072438.GB166182@mtl-vdi-166.wap.labs.mlnx>
 <c08fb86b-29d1-6b79-c421-abc7b37e8a9c@redhat.com>
 <20210819074819.GA167253@mtl-vdi-166.wap.labs.mlnx>
 <20210819081535.GB167253@mtl-vdi-166.wap.labs.mlnx>
In-Reply-To: <20210819081535.GB167253@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Aug 2021 16:19:01 +0800
Message-ID: <CACGkMEsQSxPzhA+2gVQjjoodb=Oiicg5Ew0aV4N8303zu4EJtw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] vdpa/mlx5: Add support for control VQ and MAC
 setting
To: Eli Cohen <elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: eperezma <eperezma@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 mst <mst@redhat.com>
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

T24gVGh1LCBBdWcgMTksIDIwMjEgYXQgNDoxNSBQTSBFbGkgQ29oZW4gPGVsaWNAbnZpZGlhLmNv
bT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxOSwgMjAyMSBhdCAxMDo0ODoxOUFNICswMzAwLCBF
bGkgQ29oZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxOSwgMjAyMSBhdCAwMzo0MTo1MlBNICsw
ODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPgo+ID4gPiDlnKggMjAyMS84LzE5IOS4i+WNiDM6
MjQsIEVsaSBDb2hlbiDlhpnpgZM6Cj4gPiA+ID4gPiA+ID4gPiArIHZyaW5naF9zZXRfaW90bGIo
Jm12ZGV2LT5jdnEudnJpbmcsIG12ZGV2LT5jdnEuaW90bGIsICZtdmRldi0+Y3ZxLmlvbW11X2xv
Y2spOwo+ID4gPiA+ID4gPiA+ID4gKyBlcnIgPSBpb3ZhX2NhY2hlX2dldCgpOwo+ID4gPiA+ID4g
PiA+IEFueSByZWFzb24gZm9yIHVzaW5nIGlvdmEgY2FjaGUgaGVyZT8KPiA+ID4gPiA+ID4gSXNu
J3QgaXQgcmVxdWlyZWQ/IEFyZW4ndCB3ZSBhbGxvY2F0aW5nIGJ1ZmZlcnMgZm9yIHRoZSBDVlEg
ZnJvbQo+ID4gPiA+ID4gPiBpb21tdV9pb3ZhIGttZW0gY2FjaGU/Cj4gPiA+ID4gPiBJIG1heSBt
aXNzIHNvbWV0aGluZyBoZXJlIGJ1dCB3aGljaCBidWZmZXIgZGlkIHlvdSByZWZlciBoZXJlPwo+
ID4gPiA+ID4KPiA+ID4gPiBBcmVuJ3QgdGhlIGRhdGEgYnVmZmVycyBmb3IgdGhlIGNvbnRyb2wg
VlEgYWxsb2NhdGVkIGZyb20gdGhpcyBjYWNoZT8KPiA+ID4KPiA+ID4KPiA+ID4gU29ycnksIGJ1
dCB5b3UgbWVhbiB0aGUgYnVmZmVyIG1hbmFnZWQgYnkgdGhlIHZpcnRpby1uZXQgb3IgdGhlIG1s
eDVlIGhlcmU/Cj4gPgo+ID4gSSBhc3N1bWUgYm90aCBkaXJlY3Rpb25zOiB2aXJ0aW9fbmV0IHNl
bmRzIGEgY29udHJvbCBtZXNzYWdlIGFuZCB1c2VzIGEKPiA+IGEgYnVmZmVyIHRvIHB1dCBpbmZv
cm1hdGlvbiBpbi4gbWx4NV92ZHBhIHJlc3BvbmRzIGFuZCB1c2VzIGRhdGEgYnVmZmVyCj4gPiBm
b3IgdGhlIHJlc3BvbnNlLgo+ID4KPiA+IElzIGl0IG5vdCBzbz8KPiA+Cj4KPiBTZWVtcyBsaWtl
IHJlbW92aW5nIGl0IGRvZXMgbm90IGh1cnQuCj4gV2lsbCByZW1vdmUuCgpZZXMsIG15IHVuZGVy
c3RhbmRpbmcgaXMgdGhhdCBpdCBpcyBvbmx5IHJlcXVpcmVkIGlmIHlvdSdyZSB1c2luZyB0aGUK
aW92YSBhbGxvY2F0b3IuCgpUaGFua3MKCj4KPiA+ID4KPiA+ID4gVGhhbmtzCj4gPiA+Cj4gPiA+
Cj4gPiA+ID4KPiA+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
