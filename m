Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F33957C0
	for <lists.virtualization@lfdr.de>; Mon, 31 May 2021 11:02:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0502340292;
	Mon, 31 May 2021 09:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1iCiPZK2PRr; Mon, 31 May 2021 09:02:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B821140190;
	Mon, 31 May 2021 09:02:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61A0EC0024;
	Mon, 31 May 2021 09:02:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1FE9C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 09:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F8A4035E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 09:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDlC6nOiAaYO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 09:02:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3592340340
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622451721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIfKHYGoxDAlco9EwYWb84ApD4P9OUzvy3umVjsoEYY=;
 b=PkUVSlgfPGfGoMs1isP/NqeUuvF+NOhimA0BIpQlBa+pSMgTkefhsTZD4LIDRvdEbproZm
 Vbp5sroopZ3pQHrkk57WLv4gP6zwyIMAi/LZpFyhaDEeDxnP5O/HfZZ20NgUCof81bP7Hz
 j6Nid7EcZiQcGrscJKXmn3v8BOU/LIM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-7UiflRoQPUWNZLyPa_R0Zw-1; Mon, 31 May 2021 05:02:00 -0400
X-MC-Unique: 7UiflRoQPUWNZLyPa_R0Zw-1
Received: by mail-pj1-f71.google.com with SMTP id
 i8-20020a17090a7188b029015f9564a698so10076211pjk.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 02:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RIfKHYGoxDAlco9EwYWb84ApD4P9OUzvy3umVjsoEYY=;
 b=e+zHTfAJlVgWkYjN0qlpgY5gaPJunrOPYCfydf5f9Oikz1uTBAOm4o9psvGxxCa6/4
 bLapq1fpYFD71D9NEmwsFC+z6/qukH/pc2juYPO+bUbKTqJhLMeoZpEU3H6Uwh99aoJo
 Hh+8kj5gyMOSXcTeRxEPUkSCPXhZMsMcufigPdjHok+tE5mTHtslvOQ7nXMNIM5mhCsn
 v3dqhoQJOT918Gluy8QCSrmTo3IqX8gHwnA+8cDwmYLSUyylM4yXpvjT6YH1YKV0Bx/M
 h5aJCyizWe6G3BGIjPN+F/lIO+mCXBMit3kJqzmECzz3mjMGaWeWAPqSmMwnH8WT+aqd
 BU9Q==
X-Gm-Message-State: AOAM5301GTjip1yKUG2inxacy6WZZNsWTuOcZ1PXKluqYwtim3jBVdby
 3SNNbWrZSn/hjEj4LtnOE5CD05WNoEYxBtUARfOCYdbqOUbEZCPgt6wqhjQD3rmrWTc92eHe85G
 7l5QGnXXn3ijnJck6qyQqvPge/CwTSDEuLRtSFSz9aRbgwp/QOGh4uOuFp5ksXAshffzmay6jQE
 lzG7oK9EfhyYndWlWpIQ==
X-Received: by 2002:a17:902:ce90:b029:f7:72be:b420 with SMTP id
 f16-20020a170902ce90b02900f772beb420mr19897920plg.67.1622451718856; 
 Mon, 31 May 2021 02:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2hdeqGMIfYNTYU8clc9+twdeQAe/m+mhJ7pDFqRy5UGF8hWFQbXEkh+rIP/5mvOlabo0rwg==
X-Received: by 2002:a17:902:ce90:b029:f7:72be:b420 with SMTP id
 f16-20020a170902ce90b02900f772beb420mr19897872plg.67.1622451718392; 
 Mon, 31 May 2021 02:01:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s9sm10333699pfm.120.2021.05.31.02.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 02:01:57 -0700 (PDT)
Subject: Re: [RFC v3 15/29] vhost: Add enable_custom_iommu to VhostOps
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-16-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8ba8f8fa-cab8-24c6-5226-b5ae372cd84b@redhat.com>
Date: Mon, 31 May 2021 17:01:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-16-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>
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

CuWcqCAyMDIxLzUvMjAg5LiK5Y2IMTI6MjgsIEV1Z2VuaW8gUMOpcmV6IOWGmemBkzoKPiBUaGlz
IG9wZXJhdGlvbiBlbmFibGUgdGhlIGJhY2tlbmQtc3BlY2lmaWMgSU9UTEIgZW50cmllcy4KPgo+
IElmIGEgYmFja2VuZCBzdXBwb3J0IHRoaXMsIGl0IHN0YXJ0IG1hbmFnaW5nIGl0cyBvd24gZW50
cmllcywgYW5kIHZob3N0Cj4gY2FuIGRpc2FibGUgaXQgdGhyb3VnaCB0aGlzIG9wZXJhdGlvbiBh
bmQgcmVjb3ZlciBjb250cm9sLgo+Cj4gRXZlcnkgZW5hYmxlL2Rpc2FibGUgb3BlcmF0aW9uIG11
c3QgYWxzbyBjbGVhciBhbGwgSU9UTEIgZGV2aWNlIGVudHJpZXMuCj4KPiBBdCB0aGUgbW9tZW50
LCB0aGUgb25seSBiYWNrZW5kIHRoYXQgZG9lcyBzbyBpcyB2aG9zdC12ZHBhLiBUbyBmdWxseQo+
IHN1cHBvcnQgdGhlc2UsIHZkcGEgbmVlZHMgYWxzbyB0byBleHBvc2UgYSB3YXkgZm9yIHZob3N0
IHN1YnN5c3RlbSB0bwo+IG1hcCBhbmQgdW5tYXAgZW50cmllcy4gVGhpcyB3aWxsIGJlIGRvbmUg
aW4gZnV0dXJlIGNvbW1pdHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBl
cmV6bWFAcmVkaGF0LmNvbT4KCgpJIHRoaW5rIHRoZXJlJ3MgcHJvYmFibHkgbm8gbmVlZCB0byBp
bnRyb2R1Y2UgdGhpcyBoZWxwZXIuCgpJbnN0ZWFkLCB3ZSBjYW4gaW50cm9kdWNlIG9wcyBsaWtl
IHNoYWRvd192cV9zdGFydCgpL3N0b3AoKS4gVGhlbiB0aGUgCmRldGFpbHMgbGlrZSB0aGlzIGNv
dWxkIGJlIGhpZGVkIHRoZXJlLgoKKEFuZCBoaWRlIHRoZSBiYWNrZW5kIGRlYXRpbHMgKGF2b2lk
IGNhbGxpbmcgdmhvc3RfdmRwYV9kbWFfbWFwKCkpIApkaXJlY3RseSBmcm9tIHRoZSB2aG9zdC5j
KQoKVGhhbmtzCgoKPiAtLS0KPiAgIGluY2x1ZGUvaHcvdmlydGlvL3Zob3N0LWJhY2tlbmQuaCB8
IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LWJhY2tlbmQuaCBiL2luY2x1ZGUvaHcvdmlydGlv
L3Zob3N0LWJhY2tlbmQuaAo+IGluZGV4IGJjYjExMmMxNjYuLmY4ZWVkMmFjZTUgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtYmFja2VuZC5oCj4gKysrIGIvaW5jbHVkZS9o
dy92aXJ0aW8vdmhvc3QtYmFja2VuZC5oCj4gQEAgLTEyOCw2ICsxMjgsOSBAQCB0eXBlZGVmIGJv
b2wgKCp2aG9zdF9mb3JjZV9pb21tdV9vcCkoc3RydWN0IHZob3N0X2RldiAqZGV2KTsKPiAgIAo+
ICAgdHlwZWRlZiBpbnQgKCp2aG9zdF92cmluZ19wYXVzZV9vcCkoc3RydWN0IHZob3N0X2RldiAq
ZGV2KTsKPiAgIAo+ICt0eXBlZGVmIGludCAoKnZob3N0X2VuYWJsZV9jdXN0b21faW9tbXVfb3Ap
KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIGVuYWJsZSk7Cj4gKwo+ICAgdHlwZWRlZiBpbnQgKCp2aG9zdF9n
ZXRfaW92YV9yYW5nZSkoc3RydWN0IHZob3N0X2RldiAqZGV2LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaHdhZGRyICpmaXJzdCwgaHdhZGRyICpsYXN0KTsKPiAgIAo+
IEBAIC0xNzcsNiArMTgwLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgVmhvc3RPcHMgewo+ICAgICAgIHZo
b3N0X2dldF9kZXZpY2VfaWRfb3Agdmhvc3RfZ2V0X2RldmljZV9pZDsKPiAgICAgICB2aG9zdF92
cmluZ19wYXVzZV9vcCB2aG9zdF92cmluZ19wYXVzZTsKPiAgICAgICB2aG9zdF9mb3JjZV9pb21t
dV9vcCB2aG9zdF9mb3JjZV9pb21tdTsKPiArICAgIHZob3N0X2VuYWJsZV9jdXN0b21faW9tbXVf
b3Agdmhvc3RfZW5hYmxlX2N1c3RvbV9pb21tdTsKPiAgICAgICB2aG9zdF9nZXRfaW92YV9yYW5n
ZSB2aG9zdF9nZXRfaW92YV9yYW5nZTsKPiAgIH0gVmhvc3RPcHM7Cj4gICAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
