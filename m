Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 488CE3B6D1C
	for <lists.virtualization@lfdr.de>; Tue, 29 Jun 2021 05:42:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82B3240287;
	Tue, 29 Jun 2021 03:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lha5T9FPt51f; Tue, 29 Jun 2021 03:42:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 558954028A;
	Tue, 29 Jun 2021 03:42:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7DCAC001F;
	Tue, 29 Jun 2021 03:42:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33945C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 03:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21E1F600D1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 03:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ud5WpoSAljYk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 03:42:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CEA9600B5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 03:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624938121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obTHM9UxmEbvztFIECSmgQ8pfpknaOT/S1rrTtHO/H4=;
 b=B7NwltuHywmhQHPEl8c/hYNESIb3MFjj/jccRji6FDtbAWxxeww+8pQUtkeCzyTvZEyLQH
 9J3lQ/8DRnsrhrt0DJmKXR48N3+6KPb6bIv3yuSQeP1/v9rlkxWXQAM07yLNhXNtySMmLG
 gWeZy8kgG8IiVZfcJMFO0DGF4gvGq+c=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-cvnloNZ1OlipEGOW3EvuEg-1; Mon, 28 Jun 2021 23:41:59 -0400
X-MC-Unique: cvnloNZ1OlipEGOW3EvuEg-1
Received: by mail-pj1-f69.google.com with SMTP id
 u8-20020a17090a8908b029016f79b38655so1324375pjn.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Jun 2021 20:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=obTHM9UxmEbvztFIECSmgQ8pfpknaOT/S1rrTtHO/H4=;
 b=OuJY18591XdaXx/74HAT9EzAjq/jaTbG6Sye2hUnuAqnBIqwfgH+AGT6LGRj0BjzuQ
 uHAm7dZ4V7itFRgu/v8jMIEUe7NdYPPPngIc2WsDqsn2ahXCnjjW+gTH5tUYZWrwIxse
 AS8E4oCQKUhzEPIYctw7SwS8tD5QKVYyCbL3e7AUiXBRGnqN3K5bYobVoyqxXpS1qjqj
 4STi1c0Qt7IcegJyrNE/1DB3osP8eUAJsO5ruhoSmYBynmCU5vEsUpYkn4VQzV43/7AF
 5fAjSn9pMRNEVcgEcCNXccFQ4KCnbVGMNzZxSmkbptsUjeXPOWwhskijiozjZafKqqv5
 xPMA==
X-Gm-Message-State: AOAM530h63A1q86/USJ38c0tzI5OJogHcOLRsp6H09Nftm9MZSOq+YoE
 G7staoiHSJe086EU+DEGEran94is8zHoTxVErzDT9U3e8gSUs5TKVQjfay1B56aZfvbhMvJgLy6
 /ciCul/HW2HA6vFJe/IN+XluqgFrnR809pw3aHILWiQ==
X-Received: by 2002:a17:90a:6fc1:: with SMTP id
 e59mr32123532pjk.37.1624938118741; 
 Mon, 28 Jun 2021 20:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJZli4P9Dvf7Vb2TeuKAmxvI50el/itgtemRCOBWHDgBhGrIpy0qAlqmtw41qH/cRzcOgIGA==
X-Received: by 2002:a17:90a:6fc1:: with SMTP id
 e59mr32123521pjk.37.1624938118583; 
 Mon, 28 Jun 2021 20:41:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a9sm15595425pfo.69.2021.06.28.20.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 20:41:58 -0700 (PDT)
Subject: Re: [PATCH linux-next v3 2/6] vdpa: Introduce query of device config
 layout
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <PH0PR12MB5481AE651E0E9BFA6A1839EEDC099@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0434617e-f960-eb1a-a682-49b6a754413f@redhat.com>
 <PH0PR12MB548147BE1B95CB294785470CDC089@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d361bd10-3967-8844-1457-48e7e9422fb2@redhat.com>
 <PH0PR12MB54812DD2DADAD0897E24CFA7DC079@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4e0708fb-34e3-471d-ca98-44c75f693b32@redhat.com>
 <PH0PR12MB54811C39B86AC8D6BECA9E05DC079@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0a8bdf-4cd2-2fc2-73a5-53fb2ab432b6@redhat.com>
 <PH0PR12MB54819F782D5D7E6F9DCDF5FEDC069@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5350f5c0-c707-c3ec-8ed8-16c884467ffa@redhat.com>
 <20210628183831-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <80b42ef6-b8ba-c0f6-3a6f-30f9125ebd35@redhat.com>
Date: Tue, 29 Jun 2021 11:41:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628183831-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Eli Cohen <elic@nvidia.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNi8yOSDJz87nNjozOSwgTWljaGFlbCBTLiBUc2lya2luINC0tcA6Cj4gT24gTW9u
LCBKdW4gMjgsIDIwMjEgYXQgMDE6MDM6MjBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
U28gSSB0aGluayB3ZSBuZWVkIHNvbHZlIHRoZW0gYWxsLCBidXQgbmV0bGluayBpcyBwcm9iYWJs
eSB0aGUgd3JvbmcgbGF5ZXIsCj4+IHdlIG5lZWQgdG8gc29sdmUgdGhlbSBhdCB2aXJ0aW8gbGV2
ZWwgYW5kIGxldCBuZXRsaW5rIGEgdHJhbnNwb3J0IGZvciB0aGVtCj4+IHZpcnRpbyB1QVBJL0FC
SS4KPiBJJ20gbm90IHN1cmUgSSBmb2xsb3cuIHZpcnRpbyBkZWZpbmVzIFZGIHRvIGRyaXZlciBj
b21tdW5pY2F0aW9uLgo+IFRoaXMgaXMgUEYgdG8gaHlwZXJ2aXNvci4gdmlydGlvIHNpbXBseSBk
b2VzIG5vdCBjb3ZlciBpdCBBVE0uCgoKTm90ZSB0aGF0IHRoaXMgaXMgbm90IFBGIHRvIGh5cGVy
dmlzb3IgYnV0IHRoZSB1QVBJIGZyb20gdXNlcnNwYWNlICh2RFBBIAp0b29sKSB0byB2RFBBIGNv
cmUuCgpXZSBoYWQgdHdvIGNob2ljZXMuCgoxKSB0d2VhayB2aXJ0aW8gdUFQSXMKMikgaW52ZW50
IHZpcnRpbyBzcGVjaWZpYyB1QVBJIGluIG5ldGxpbmsKCjEpIHNlZW1zIGJldHRlci4KClRoYW5r
cwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
