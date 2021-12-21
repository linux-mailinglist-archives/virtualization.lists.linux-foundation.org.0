Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA6F47B9D5
	for <lists.virtualization@lfdr.de>; Tue, 21 Dec 2021 07:05:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8713823E8;
	Tue, 21 Dec 2021 06:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UYrfM8dxhPi; Tue, 21 Dec 2021 06:04:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9A0D482468;
	Tue, 21 Dec 2021 06:04:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DB01C0039;
	Tue, 21 Dec 2021 06:04:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59B86C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Dec 2021 06:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33162408DD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Dec 2021 06:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVzkjBcNdf56
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Dec 2021 06:04:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3BCB408DC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Dec 2021 06:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640066693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Y4JSBs01cDvmoNB1MDaLd9pDjEwXAPCR4vdtT4iPhs=;
 b=Jx3gyDU83zb45AQOkjWeY9Wv1/CslIri6zWfxOoosc7pJ49MLzQbDQuNCbxX3LQOlMYjmX
 mGpKGXIir4SFCzXEAVetxgFF1n48I8xEngTtLGxQ6HADlb1OuKmbv8pmj4ovRNYTeziA0o
 uudQH9xg13o8xSHCSv1DE+CWzM92eRY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-QiQHP6vyOAipLNQV4bz5UA-1; Tue, 21 Dec 2021 01:04:47 -0500
X-MC-Unique: QiQHP6vyOAipLNQV4bz5UA-1
Received: by mail-pl1-f198.google.com with SMTP id
 f16-20020a170902ce9000b001436ba39b2bso3378036plg.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Dec 2021 22:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Y4JSBs01cDvmoNB1MDaLd9pDjEwXAPCR4vdtT4iPhs=;
 b=a/wwZs2FipA+dISHG1rsNi0Ucteyh2gVJe00ZAA/Z6gtZLP0FGx2UrxMPtKLxUcVkW
 mEcRQ2iqAtbAvNhzO3RC7EC5EX6vADYD6cfWhcx02E8sYBGsfvu8t6Q3fk651kjawT/P
 BJSHh2bIiF4zwbfQ0Zx1En2wtv/DVdwE93xwiGyopfaJ/vsQkKkkryIo5psDEtUV+31X
 RD3I9+/81jVfq3PFj8oapQeyEVerWDK/MdB7VIaFO42U30gAg/irItEWCHHQRqOz/zko
 74eGHRsO3DoIbKhkdgKRK72p4u3zX3yJdnZrnldc8Fc4Gb1odY0v2fwCuymFyRKfYMI8
 MmCw==
X-Gm-Message-State: AOAM530s+iuxt2QPCIdb3+ljWNheDSSAJXy0p11pNbNzZez6JK1Jbv4k
 UfKxGP47l+rLvW/fFAJ0Fhf4mTSDAnDcZkI3Ty3j1wIZ/UABMVdltURkIRuAvK8zgNbRk7Ys1nE
 2vKMlL7Uo+MAYsmeqs0lWKndP33z1xURAGBbcRvqGyw==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
 om5mr2285128pjb.145.1640066685885; 
 Mon, 20 Dec 2021 22:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2GIbFVFityI3VxdyVVfXUJ1fpGUgsE/rlnlff4KwlSMXzX9f5fbQGgn5LzUGV0XhHlWvziQ==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
 om5mr2285111pjb.145.1640066685697; 
 Mon, 20 Dec 2021 22:04:45 -0800 (PST)
Received: from [10.72.13.80] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b11sm6290969pfv.39.2021.12.20.22.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 22:04:45 -0800 (PST)
Message-ID: <81b998f6-fa36-7d44-19ef-b6c0d055fa28@redhat.com>
Date: Tue, 21 Dec 2021 14:04:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 09/10] vdpa/mlx5: Configure max supported virtqueues
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org
References: <20211219140236.27479-1-elic@nvidia.com>
 <20211219140236.27479-10-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20211219140236.27479-10-elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: lvivier@redhat.com, eperezma@redhat.com, si-wei.liu@oracle.com
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

CuWcqCAyMDIxLzEyLzE5IOS4i+WNiDEwOjAyLCBFbGkgQ29oZW4g5YaZ6YGTOgo+IENvbmZpZ3Vy
ZSBtYXggc3VwcG9ydGVkIHZpcnRxdWV1ZXMgb24gdGhlIG1hbmFnZW1lbnQgZGV2aWNlLiBUaGlz
IGluZm8KPiBjYW4gYmUgcmV0cmlldmVkIHVzaW5nOgo+Cj4gJCB2ZHBhIGRldiBzaG93Cj4gdmRw
YS1hOiB0eXBlIG5ldHdvcmsgbWdtdGRldiBhdXhpbGlhcnkvbWx4NV9jb3JlLnNmLjEgdmVuZG9y
X2lkIDU1NTUgXAo+IAltYXhfdnFwIDMgbWF4X3ZxX3NpemUgMjU2IG1heF9zdXBwb3J0ZWRfdnFz
IDI1NgoKCkkgc3RpbGwgdGhpbmsgd2Ugc2hvdWxkIHJlcG9ydCAyNTcgaGVyZSB0byBiZSBhbGln
bmVkIHdpdGggdGhlIHNwZWMgZXZlbiAKaWYgd2Uga25vdyBjdnEgaXMgcHJvYmFibHkgZW11bGF0
ZWQuCgoKPgo+IFNpZ25lZC1vZmYtYnk6IEVsaSBDb2hlbiA8ZWxpY0BudmlkaWEuY29tPgo+IC0t
LQo+ICAgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIHwgMSArCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvbWx4
NS9uZXQvbWx4NV92bmV0LmMgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiBp
bmRleCA3MmVkNWVmYmUzNWQuLjY4ZGJkZGFkZGU5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zk
cGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4
NV92bmV0LmMKPiBAQCAtMjY4OSw2ICsyNjg5LDcgQEAgc3RhdGljIGludCBtbHg1dl9wcm9iZShz
dHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldiwKPiAgIAltZ3RkZXYtPm1ndGRldi5pZF90YWJs
ZSA9IGlkX3RhYmxlOwo+ICAgCW1ndGRldi0+bWd0ZGV2LmNvbmZpZ19hdHRyX21hc2sgPSBCSVRf
VUxMKFZEUEFfQVRUUl9ERVZfTkVUX0NGR19NQUNBRERSKSB8Cj4gICAJCQkJCSAgQklUX1VMTChW
RFBBX0FUVFJfREVWX05FVF9DRkdfTUFYX1ZRUCk7Cj4gKwltZ3RkZXYtPm1ndGRldi5tYXhfc3Vw
cG9ydGVkX3ZxcyA9IE1MWDVfQ0FQX0RFVl9WRFBBX0VNVUxBVElPTihtZGV2LCBtYXhfbnVtX3Zp
cnRpb19xdWV1ZXMpOwoKCkRvIHdlIG5lZWQgdG8gY2hhbmdlIG90aGVyIHZkcGEgcGFyZW50IGxp
a2UgdGhlIHNpbXVsYXRvciBhbmQgaWZjdmY/CgpUaGFua3MKCgo+ICAgCW1ndGRldi0+bWFkZXYg
PSBtYWRldjsKPiAgIAo+ICAgCWVyciA9IHZkcGFfbWdtdGRldl9yZWdpc3RlcigmbWd0ZGV2LT5t
Z3RkZXYpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
