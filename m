Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FA6BC97F
	for <lists.virtualization@lfdr.de>; Thu, 16 Mar 2023 09:43:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D7A60F7E;
	Thu, 16 Mar 2023 08:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D7A60F7E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eSAELSJO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65ujyR02Bpqd; Thu, 16 Mar 2023 08:43:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D608360B89;
	Thu, 16 Mar 2023 08:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D608360B89
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29DF5C008D;
	Thu, 16 Mar 2023 08:43:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BF7DC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Mar 2023 08:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73B6E81F16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Mar 2023 08:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73B6E81F16
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eSAELSJO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQaXGUhWsaYI
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Mar 2023 08:42:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91EF981F0B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91EF981F0B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Mar 2023 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678956175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNIt6/EC2fPTtrcmtD4NvPKR+xt/u6QnYqo+DbsIIYU=;
 b=eSAELSJOcz1Kt89EymhhhmK0us+MyT8vh2Dr2tQiWdrQEyFkKSGS8adxwZuoSLKxvtfTo8
 KXXjqeOvy9UUaGoyfPtUaeqMRjBg1HFypib3KtdgmBeEiLb9NL8BaMIF0je2YmHO9qMQly
 JFgAlXvLRwhSZFzdYYV2HiZAcklxezo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-BBzkOO54P-u-pA9B_RUzFw-1; Thu, 16 Mar 2023 04:42:53 -0400
X-MC-Unique: BBzkOO54P-u-pA9B_RUzFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c024100b003ec8023ac4eso357898wmj.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Mar 2023 01:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956173;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNIt6/EC2fPTtrcmtD4NvPKR+xt/u6QnYqo+DbsIIYU=;
 b=ZkfOx3nD2/k8sy716kT5duhMGASpsY3naU6KGvWkJf90ltLAKS2TKSG59TeJ1uDTt0
 hWup3cPXRurXthX8nq4EJ3Yh2Nyd4YiQiwaFanAZAjQnVRW3rSkEinoBD9z3jVIutquu
 VP2BX1+1kE9oAoyBnRkxPLlS2UePN5F3Pi/ozepoJjc8lmB+QUrg5gESE1RmU+HAKko0
 mv8tJgmS4dITKNcD+MEKR0WcU02DCYej5Hjp/kDez6tB3LbooLYG1sxQ2o082XQ1jw4E
 Ul8/pQmJ573Z/fSjcO0dnzkceDymg8LRgu+6tGFvH48l6spPwOhX2Hk6cWHyc3bU9YKt
 yocQ==
X-Gm-Message-State: AO0yUKVpYFcC6rcei+fbz1+O9xLzZ/htYxDe0DvpMbXyQalt3huC2oOG
 gMIj6zTEta7w1mkLf+Czl7xa2ij8CU91jA0jQ+Fu3+6d7OxEBDs6yGuHJbRtUogDo3QPARJ4kXa
 mdLA9dL12VI43moP0C8p88YPQ2vaZD+L1JYrW3OfvRA==
X-Received: by 2002:a05:600c:450b:b0:3eb:2de9:8aed with SMTP id
 t11-20020a05600c450b00b003eb2de98aedmr19691724wmo.41.1678956172846; 
 Thu, 16 Mar 2023 01:42:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set+StsW8ItLxY7viETFKNcN8XIJEpkb0A6sN2+0X6h0DH3Cm81PlzHGjafdM1NdabSKvBVlFOQ==
X-Received: by 2002:a05:600c:450b:b0:3eb:2de9:8aed with SMTP id
 t11-20020a05600c450b00b003eb2de98aedmr19691708wmo.41.1678956172618; 
 Thu, 16 Mar 2023 01:42:52 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d4a8d000000b002c5534db60bsm6673269wrq.71.2023.03.16.01.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:42:51 -0700 (PDT)
Date: Thu, 16 Mar 2023 09:42:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 7/8] vdpa_sim: replace the spinlock with a mutex to
 protect the state
Message-ID: <20230316084248.woh6dksgpu2ycn64@sgarzare-redhat>
References: <20230302113421.174582-1-sgarzare@redhat.com>
 <20230302113421.174582-8-sgarzare@redhat.com>
 <CACGkMEuCUBQeg0gLUjBXff=zMf-=qJqhMpdeUvTDk55Gz6tAVA@mail.gmail.com>
 <CACGkMEv=MkGUUP_xv9V5q+gneLm41yKqJXoWp4cYLK8Cf95oUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEv=MkGUUP_xv9V5q+gneLm41yKqJXoWp4cYLK8Cf95oUw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, stefanha@redhat.com
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

T24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMDE6MzE6MjVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPk9uIFR1ZSwgTWFyIDE0LCAyMDIzIGF0IDE6MjnigK9QTSBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBNYXIgMiwgMjAyMyBhdCA3OjM14oCv
UE0gU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPiB3cm90ZToKPj4gPgo+
PiA+IFRoZSBzcGlubG9jayB3ZSB1c2UgdG8gcHJvdGVjdCB0aGUgc3RhdGUgb2YgdGhlIHNpbXVs
YXRvciBpcyBzb21ldGltZXMKPj4gPiBoZWxkIGZvciBhIGxvbmcgdGltZSAoZm9yIGV4YW1wbGUs
IHdoZW4gZGV2aWNlcyBoYW5kbGUgcmVxdWVzdHMpLgo+PiA+Cj4+ID4gVGhpcyBhbHNvIHByZXZl
bnRzIHVzIGZyb20gY2FsbGluZyBmdW5jdGlvbnMgdGhhdCBtaWdodCBzbGVlcCAoc3VjaCBhcwo+
PiA+IGt0aHJlYWRfZmx1c2hfd29yaygpIGluIHRoZSBuZXh0IHBhdGNoKSwgYW5kIHRodXMgaGF2
aW5nIHRvIHJlbGVhc2UKPj4gPiBhbmQgcmV0YWtlIHRoZSBsb2NrLgo+PiA+Cj4+ID4gRm9yIHRo
ZXNlIHJlYXNvbnMsIGxldCdzIHJlcGxhY2UgdGhlIHNwaW5sb2NrIHdpdGggYSBtdXRleCB0aGF0
IGdpdmVzCj4+ID4gdXMgbW9yZSBmbGV4aWJpbGl0eS4KPj4gPgo+PiA+IFN1Z2dlc3RlZC1ieTog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4+Cj4+IEFja2VkLWJ5OiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pgo+PiBUaGFua3MKPgo+QnR3LCB0aG91Z2gg
aXQgbG9va3MgZmluZSBidXQgd2UnZCBiZXR0ZXIgZG91YmxlIGNvbmZpcm0gdmlydGlvX3ZkcGEg
d29ya3Mgd2VsbC4KCkkgdGVzdGVkIGl0LCBidXQgSSB3aWxsIGRvIGl0IG1vcmUgY2FyZWZ1bGx5
IHRvIG1ha2Ugc3VyZSBldmVyeXRoaW5nCmlzIG9rYXkuCgo+Cj4oSSB0aGluayBzbyBzaW5jZSB0
aGVyZSdzIHRyYW5zcG9ydCB0aGF0IG1pZ2h0IHNsZWVwKS4KCkkgc2VlLgoKVGhhbmtzLApTdGVm
YW5vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
