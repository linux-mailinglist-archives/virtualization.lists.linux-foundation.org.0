Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB73F8164
	for <lists.virtualization@lfdr.de>; Thu, 26 Aug 2021 06:02:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBCCC42563;
	Thu, 26 Aug 2021 04:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGgi7n3DeduO; Thu, 26 Aug 2021 04:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BCBB942559;
	Thu, 26 Aug 2021 04:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39D8BC0022;
	Thu, 26 Aug 2021 04:02:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A262BC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Aug 2021 04:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B5C42563
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Aug 2021 04:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uuayqlr5Z3-x
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Aug 2021 04:02:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B44842559
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Aug 2021 04:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629950537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nywGIoCOHJQ1/mswKgnQ9Dq384ZrldyVc6GgAW/GVu4=;
 b=APrSj9CvST4ZyFMCBFw5loZ/wkzhwbU2URfBa9pRlLi8jjgEPVxbAseoL45HGJwwLRUHEW
 CXhsNwb0fFQ8f8QmTOXPMGXhfpqmLRfR3IeuKwojB6okYi8nbyGatO9FLMlEGhii+rrWH0
 ma2Rwz2LKW4RzWiTuaxhGmg8gNUNVog=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-8N9R6UxeO-KkFJI8hiNpjQ-1; Thu, 26 Aug 2021 00:02:15 -0400
X-MC-Unique: 8N9R6UxeO-KkFJI8hiNpjQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 u8-20020a056a00098800b003eb2fbd34dcso860381pfg.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Aug 2021 21:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nywGIoCOHJQ1/mswKgnQ9Dq384ZrldyVc6GgAW/GVu4=;
 b=CRbzm/IMxj79u3jkmmcMW4qz4ukeYOXPxyQXoLqqb9Y1zcAAt2v4Wbsf4iTZpaimE2
 3Me6u8EBiAfkgdjsr6IJcu8nF9cg5FAQqw8gUyKw8uYQv2oNdojqNWOMi1gsQJH5FP/G
 GCqIz92j8mT2LYk4aQxF/XV1q7uPzBieFHumu4pqtlIc3rTCQw6hlaccKBBOJ7FKt3ND
 cF2PWbWWv2a5ulZ/YPs+5Rf5NAcn4z1S1kYvqFstXbiLWMUTQDfA9X7s/ay1YXGh/SQl
 tW4RLx26yOPbB3Lmrt2eQcvD3KRi5m+DvUfzLAQ1RLaHrNcdicxS93DqaWcHoP/jyzxo
 EvmQ==
X-Gm-Message-State: AOAM531Ab6lM8ce0iuLozFNdYvd12ZAcJmArhdnELGQWFPBdLtpcx9eV
 71OW83D5R2cKw4s6/WUFky9DJq0yRu7pgBdtSbWZ/nT79y0hemnZduwCS5tlBfwHxfYet7Krgt+
 TcryO3M5JZrXZ5NiIPU/x5FzDKS6qa0D+sKcQSzygzQ==
X-Received: by 2002:a17:90b:4d8d:: with SMTP id
 oj13mr1902238pjb.74.1629950534717; 
 Wed, 25 Aug 2021 21:02:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxaROVJpSuUGSbrcVJ38u0mNFsDkBmynRB5KTs6BguI+DqJpnEh0k64iWUDYOZNJZcKp3SBg==
X-Received: by 2002:a17:90b:4d8d:: with SMTP id
 oj13mr1902203pjb.74.1629950534398; 
 Wed, 25 Aug 2021 21:02:14 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r29sm532692pfq.88.2021.08.25.21.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 21:02:13 -0700 (PDT)
Subject: Re: [PATCH v4 1/6] vdpa/mlx5: Remove redundant header file inclusion
To: Eli Cohen <elic@nvidia.com>
References: <20210823052123.14909-1-elic@nvidia.com>
 <20210823052123.14909-2-elic@nvidia.com>
 <62864706-fb2c-b973-ab3d-8dfcc4adaf27@redhat.com>
 <20210824105238.GA146647@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7417c175-6d0a-f6c7-7787-cf01ea4e6d36@redhat.com>
Date: Thu, 26 Aug 2021 12:02:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824105238.GA146647@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: eperezma@redhat.com, virtualization@lists.linux-foundation.org,
 mst@redhat.com
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

CuWcqCAyMDIxLzgvMjQg5LiL5Y2INjo1MiwgRWxpIENvaGVuIOWGmemBkzoKPiBPbiBUdWUsIEF1
ZyAyNCwgMjAyMSBhdCAwNTowODoxMlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiDlnKgg
MjAyMS84LzIzIOS4i+WNiDE6MjEsIEVsaSBDb2hlbiDlhpnpgZM6Cj4+PiBsaW51eC9pZl92bGFu
LmggaXMgbm90IHJlcXVpcmVkLgo+Pj4gUmVtb3ZlIGl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEVsaSBDb2hlbjxlbGljQG52aWRpYS5jb20+Cj4+IEFja2VkLWJ5OiBKYXNvbiBXYW5nPGphc293
YW5nQHJlZGhhdC5jb20+Cj4+Cj4+IChidHcsIHNvbWUgb2YgbXkgYWNrcyBmb3IgcHJldmlvdXMg
dmVyc2lvbiB3ZXJlIGxvc3QpLgo+Pgo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nLgo+IEluZGVlZCBJ
IGZhaWxlZCB0byBhZGQgIkFja2VkLWJ5Li4uIiBvbiB0aGlzIG9uZS4gQXMgZm9yIHRoZSBvdGhl
cgo+IHBhdGNoZXMsIEkgd2Fzbid0IHN1cmUgaWYgeW91ciBBY2tlZC1ieSB3YXMgY29uY2x1c2l2
ZSBzbyBJIGRpZCBub3Qgd2FudAo+IHRvIGFkZCBpdCB3aXRob3V0IHlvdSBleHBsaWNpdGx5IEFj
a2luZyB0aGVtLgoKCkkgc2VlLgoKVGhhdCdzIGZpbmUuCgpUaGFua3MKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
