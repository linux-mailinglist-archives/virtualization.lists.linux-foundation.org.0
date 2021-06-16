Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF123A961E
	for <lists.virtualization@lfdr.de>; Wed, 16 Jun 2021 11:28:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83069403B3;
	Wed, 16 Jun 2021 09:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NujGk3Ht1hAE; Wed, 16 Jun 2021 09:28:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 52D7F403A9;
	Wed, 16 Jun 2021 09:28:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF5E2C000B;
	Wed, 16 Jun 2021 09:28:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5B43C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 09:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF254067A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 09:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USHL_dwKGEYo
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 09:28:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D70674065B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623835695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zVitNKk74Er4xjOzMcHQzU2fhoa7EV3XbSfyR7Byfw=;
 b=G0qunneyXER2yr+bU90+6ycD5nEOMQEO50zFWGE2ktuC0Y5ikY0AZhqLqJ7rGWfkUkSkeU
 wXgP74KHQ56KlMvQNRQOMke6ru10m6QRxSXM5GguI5vA9mfMSR5RXKxHD1h0rJ2Qa0h2se
 OsSpvNzbhdLKxhk+L9KF7PMTDjDuCEE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-dU1TJVkCNxS3keHcv3xA3w-1; Wed, 16 Jun 2021 05:28:13 -0400
X-MC-Unique: dU1TJVkCNxS3keHcv3xA3w-1
Received: by mail-pf1-f200.google.com with SMTP id
 g22-20020a056a000796b02902f0483fd9e4so1250077pfu.10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 02:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2zVitNKk74Er4xjOzMcHQzU2fhoa7EV3XbSfyR7Byfw=;
 b=BUU9vGNJdIj/OlftovhzQGoRu7Jn+CEQP/Nnvr5ghkTuLuq2ZobIVkIOtX8QKIm3Du
 w7DvdDOfEe1qPwdZqG89yg/PVGQ+hJ+yxjVSLQU+wT59/7T95xl1Dz7ZOLumIBmDD1M4
 kPQwwAHxMUKUu4MSh1AyR6wGu/JgKyuTz689O4IHwn5PbRJBXwuJSKVFhfiFstzAVJTw
 X3AEUULMfxTQG7h5cePKJof5syrsiLx4eaKypIvyCNDvCwVRbRuM05SgYZdHo2gDFlTk
 4GqG5H5z7hV99g2/AsP+NiiovP7jaSkpaPK+n81VFhaTlTxdCwHkCr1ev9cFMxes6xjN
 gyHA==
X-Gm-Message-State: AOAM530s2HADexebo/WCDmmgJ4h0XtkT3m1KlSiGQh0JMOsMh7k8cnZC
 lbL8uNkeLUIn5MFZrIZhkD1PhPYIbwRT+Kdc7olWu5qJvxWtjEHwfp62G1AtTmfnGqvra6mcvyU
 u+iaUtNojaH13FTQEbqvLfkbziYfeVqibAPCVi/cUSg==
X-Received: by 2002:a63:6644:: with SMTP id a65mr3966395pgc.431.1623835692228; 
 Wed, 16 Jun 2021 02:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP1r2/tnSACBUqAVJSZsvh4f2v25ZAQ1BpTYQ8qzqXogVVtOU0xvIAm37d5R4P1bneZXCn0Q==
X-Received: by 2002:a63:6644:: with SMTP id a65mr3966377pgc.431.1623835692066; 
 Wed, 16 Jun 2021 02:28:12 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d22sm1679372pgb.15.2021.06.16.02.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 02:28:11 -0700 (PDT)
Subject: Re: [PATCH net-next v5 03/15] virtio-net: add priv_flags
 IFF_NOT_USE_DMA_ADDR
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org
References: <20210610082209.91487-1-xuanzhuo@linux.alibaba.com>
 <20210610082209.91487-4-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6cbab579-93a7-27db-9b8f-0f94f1b20b13@redhat.com>
Date: Wed, 16 Jun 2021 17:27:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610082209.91487-4-xuanzhuo@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 "dust . li" <dust.li@linux.alibaba.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

CtTaIDIwMjEvNi8xMCDPws7nNDoyMSwgWHVhbiBaaHVvINC0tcA6Cj4gdmlydGlvLW5ldCBub3Qg
dXNlIGRtYSBhZGRyIGRpcmVjdGx5LiBTbyBhZGQgdGhpcyBwcml2X2ZsYWdzCj4gSUZGX05PVF9V
U0VfRE1BX0FERFIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4
LmFsaWJhYmEuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jCj4gaW5kZXggMDQxNmE3ZTAwOTE0Li42YzEyMzNmMGFiM2UgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvdmlydGlvX25ldC5jCj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4g
QEAgLTMwNjQsNyArMzA2NCw3IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9wcm9iZShzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldikKPiAgIAo+ICAgCS8qIFNldCB1cCBuZXR3b3JrIGRldmljZSBhcyBu
b3JtYWwuICovCj4gICAJZGV2LT5wcml2X2ZsYWdzIHw9IElGRl9VTklDQVNUX0ZMVCB8IElGRl9M
SVZFX0FERFJfQ0hBTkdFIHwKPiAtCQkJICAgSUZGX1RYX1NLQl9OT19MSU5FQVI7Cj4gKwkJCSAg
IElGRl9UWF9TS0JfTk9fTElORUFSIHwgSUZGX05PVF9VU0VfRE1BX0FERFI7CgoKSSB3b25kZXIg
aW5zdGVhZCBvZiBkb2luZyB0cmljayBsaWtlIHRoaXMsIGhvdyBhYm91dCB0ZWFjaCB0aGUgdmly
dGlvIApjb3JlIHRvIGFjY2VwdCBETUEgYWRkcmVzcyB2aWEgc2c/CgpUaGFua3MKCgo+ICAgCWRl
di0+bmV0ZGV2X29wcyA9ICZ2aXJ0bmV0X25ldGRldjsKPiAgIAlkZXYtPmZlYXR1cmVzID0gTkVU
SUZfRl9ISUdIRE1BOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
