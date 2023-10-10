Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D051A7BF2F3
	for <lists.virtualization@lfdr.de>; Tue, 10 Oct 2023 08:26:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4DAD60F1A;
	Tue, 10 Oct 2023 06:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4DAD60F1A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AQHu6O+2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNpQ8qNvZQF2; Tue, 10 Oct 2023 06:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8B69060EDB;
	Tue, 10 Oct 2023 06:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B69060EDB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBCC5C0DD3;
	Tue, 10 Oct 2023 06:26:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 881F4C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55B5A81EC7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B5A81EC7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AQHu6O+2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kawThBm_0Zp7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:26:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A569281EA5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Oct 2023 06:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A569281EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696919180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXgJjAltwNNXgE6CpFrMVez2TIFFxTWTGd+YncZ0BYc=;
 b=AQHu6O+2XGcbITedRtnlnX0Q+EYhzjHyZ27MXwmdb633K+oIUNOwZxyXFn8imCqkNkhXFz
 vyulXtuBkqgjfffn+SYJxeFVDoHKbxX4yP5LDYWgQ2a9cf6KvCa/o0W588+jPKfnu4sxLg
 8oAuS1eNvjP4LmIRUIsjnWkytlybNOs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-6OdcIcUuM-yXplXq4EXYQA-1; Tue, 10 Oct 2023 02:26:07 -0400
X-MC-Unique: 6OdcIcUuM-yXplXq4EXYQA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5043353efbdso4633227e87.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Oct 2023 23:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696919165; x=1697523965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXgJjAltwNNXgE6CpFrMVez2TIFFxTWTGd+YncZ0BYc=;
 b=QsldfsJzWDSEau9arRCAfOMA+eKzhx6PaxcJjg8cKS0jXfZ0USR1/ekLyM+9JICrAN
 h0N5ViaNuRKUy211viBHW0QYQCOdCcmaTagVH1Lz2Erv+o8n7Ykemyt8iHJsZxIx5sDN
 O9AAcCvxCv31SOm0MLsU17FqGimgXOeo+DOYGVNgY44uLqFoz+5/1Mu+82oVZqxUBabv
 hENflFVhVa4pLbnv64HCowLgCjdtRPo/jVRiN4IXv26Xr6GyD9vRZ+DJQjmw/tZo7TLS
 fGHEXmaspOOf+TuNfBSlKnovlyCu7G79WZz0dZD78k5AY+eTJ/FxxURfYz2xx//psCPA
 9Mjw==
X-Gm-Message-State: AOJu0YzgMVrV/xepN4gSjffSRt5GyTo4/zXy7n3r2J3jHsLLyqIk7YyV
 /+muW1VT/XEnbNRyLBw6nGuY4KQ4R0Pc7GZHD+ATkRVyF/hBh35TjpfSfSgVMCfEEKfPrzaLz3T
 NPKzEuyKMTjGe9bidihSJsD48bdNGCoGFr4+BNGSJfKk5lj/rGRzCmlEUlQ==
X-Received: by 2002:ac2:5e2c:0:b0:500:9524:f733 with SMTP id
 o12-20020ac25e2c000000b005009524f733mr11638587lfg.20.1696919165634; 
 Mon, 09 Oct 2023 23:26:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTRfSc/Dwktp9YhC8aXUxGnki2o7zlWGkxqIyChOD0GhfDblxBz/lw7GvevY0oxSJY788QjGmeYKUsCUmt5sc=
X-Received: by 2002:ac2:5e2c:0:b0:500:9524:f733 with SMTP id
 o12-20020ac25e2c000000b005009524f733mr11638574lfg.20.1696919165315; Mon, 09
 Oct 2023 23:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231009112401.1060447-1-dtatulea@nvidia.com>
 <20231009112401.1060447-12-dtatulea@nvidia.com>
In-Reply-To: <20231009112401.1060447-12-dtatulea@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 Oct 2023 14:25:54 +0800
Message-ID: <CACGkMEt6gQCBJNZzc-tia6YkY7z7-zF4Qc2njixVaCZMfohvpw@mail.gmail.com>
Subject: Re: [PATCH vhost v3 11/16] vdpa/mlx5: Move mr mutex out of mr struct
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
QG52aWRpYS5jb20+IHdyb3RlOgo+Cj4gVGhlIG11dGV4IGlzIG5hbWVkIGxpa2UgaXQgaXMgc3Vw
cG9zZWQgdG8gcHJvdGVjdCBvbmx5IHRoZSBta2V5IGJ1dCBpbgo+IHJlYWxpdHkgaXQgaXMgYSBn
bG9iYWwgbG9jayBmb3IgYWxsIG1yIHJlc291cmNlcy4KPgo+IFNoaWZ0IHRoZSBtdXRleCB0byBp
dCdzIHJpZ2h0ZnVsIGxvY2F0aW9uIChzdHJ1Y3QgbWx4NV92ZHBhX2RldikgYW5kCj4gZ2l2ZSBp
dCBhIG1vcmUgYXBwcm9wcmlhdGUgbmFtZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERyYWdvcyBUYXR1
bGVhIDxkdGF0dWxlYUBudmlkaWEuY29tPgo+IEFja2VkLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBl
cmV6bWFAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
