Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE03BB6AD
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 07:11:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA6494017B;
	Mon,  5 Jul 2021 05:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQP6k8V_kxEx; Mon,  5 Jul 2021 05:11:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9595F40169;
	Mon,  5 Jul 2021 05:11:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EA79C000E;
	Mon,  5 Jul 2021 05:11:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80886C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 05:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5211D83A1C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 05:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sX9Jqua5fkZw
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 05:11:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F77E839DD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 05:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625461885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Budpf1Mgf5nAGlE4gIILC+M5chaMjcLyULIkUSMyGOQ=;
 b=eEeHdGLHUR8XuithS7p8ZYAmuf9+sKjwgMcyn4rvr3+AxTdfssLTIkPGQVCsXxzXpm4knH
 +De/D3SdunPJ1qb5eywBeVzLpPrvipbWZ+xZht0+syS/Xzx6HplKtz1BcFQH4EZqaJ8mN3
 O6cYrXYFeeS3Rnb6uckDBOq+vaRUVPI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-6iJkBZ5GNPuWuoxLUAhPnw-1; Mon, 05 Jul 2021 01:11:24 -0400
X-MC-Unique: 6iJkBZ5GNPuWuoxLUAhPnw-1
Received: by mail-pg1-f199.google.com with SMTP id
 n21-20020a6563d50000b029022866cd1f17so7035140pgv.10
 for <virtualization@lists.linux-foundation.org>;
 Sun, 04 Jul 2021 22:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Budpf1Mgf5nAGlE4gIILC+M5chaMjcLyULIkUSMyGOQ=;
 b=HLUFK3SjiWELUW8+QsvDHblYwxXjCJfwK4VmqUu0+EpcoGqQ63q0QVeUsugvFn1RGs
 CsdgpEZH6PSXdITD42MTb9mvoY0Jf3j2rO8YCNR+/7zteh9DddrGi0FE7B25/sFuGrKO
 oLXcbrtVldcyKZseuqvykfFMlJXkMMxVr7hnUYW0SQOY8p1RIwngYmSMaYWUus7Jap8B
 vWCTpVuLHXU1HtcBBgKcjC977S8vSlBQ2mnrFvSd6/e0/O5EDfYRMRvMIbLH/myl+X7t
 QNHVlvf1jIuYLDfGz50RCVsvXg2cAj2f8VvRB7lJULdy2JgRH6I1ohF6VXJrkEfu/vlc
 NnEw==
X-Gm-Message-State: AOAM533uzpHeLRwBLtG8poKCG91tcjOh/jSx7gAb/CvgkMkkEk+BU3FZ
 ZoOf1zVFBRk39+oWHCgzFQK7pVXWauwI58Mzw2Pxg2d1zlKOvvc70lnz8HFRV71Ar1XFWhXJrPD
 +Bx6odgNfiLvnp9B89noETr5MfIuibp8JrNQ3D9/rDw==
X-Received: by 2002:a17:902:650d:b029:129:6334:8c4a with SMTP id
 b13-20020a170902650db029012963348c4amr9272374plk.20.1625461883503; 
 Sun, 04 Jul 2021 22:11:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJCFGroygE7vEijZr/eaDJsT7meM9aLfG/XFfEYs3JYtEA2L8QESskXuh0Yg60Cy5TejmAqA==
X-Received: by 2002:a17:902:650d:b029:129:6334:8c4a with SMTP id
 b13-20020a170902650db029012963348c4amr9272365plk.20.1625461883324; 
 Sun, 04 Jul 2021 22:11:23 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r10sm12442127pga.48.2021.07.04.22.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 22:11:22 -0700 (PDT)
Subject: Re: [RFC PATCH] vhost-vdpa: mark vhost device invalid to reflect vdpa
 device unregistration
From: Jason Wang <jasowang@redhat.com>
To: gautam.dawar@xilinx.com
References: <20210704205205.6132-1-gdawar@xilinx.com>
 <3d02b8f5-0a6b-e8d1-533d-8503da3fcc4e@redhat.com>
Message-ID: <d392646d-c871-8203-ae67-f21db0388380@redhat.com>
Date: Mon, 5 Jul 2021 13:11:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3d02b8f5-0a6b-e8d1-533d-8503da3fcc4e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, martinh@xilinx.com,
 hanand@xilinx.com
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

CuWcqCAyMDIxLzcvNSDkuIrljYgxMTo0OCwgSmFzb24gV2FuZyDlhpnpgZM6Cj4KPiDlnKggMjAy
MS83LzUg5LiK5Y2INDo1MiwgZ2F1dGFtLmRhd2FyQHhpbGlueC5jb20g5YaZ6YGTOgo+PiDCoMKg
wqDCoMKgIHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZCh2bWEtPnZtX3BhZ2Vf
cHJvdCk7Cj4+IEBAIC0xMDkxLDExICsxMTIyLDEzIEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZkcGFf
cmVtb3ZlKHN0cnVjdCAKPj4gdmRwYV9kZXZpY2UgKnZkcGEpCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBvcGVuZWQgPSBhdG9taWNfY21weGNoZygmdi0+b3BlbmVkLCAwLCAxKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghb3BlbmVkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPj4gLcKgwqDCoMKgwqDCoMKgIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmdi0+Y29t
cGxldGlvbiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbXNlY3NfdG9famlmZmllcygxMDAwKSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBkZXZfd2Fybl9v
bmNlKCZ2LT5kZXYsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlcyB3
YWl0aW5nIGZvci9kZXYvJXMgdG8gYmUgY2xvc2VkXG4iLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBfX2Z1bmNfXywgZGV2X25hbWUoJnYtPmRldikpOwo+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKCF3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJnYtPmNvbXBsZXRpb24s
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1zZWNz
X3RvX2ppZmZpZXMoMTAwMCkpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJu
KCZ2LT5kZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiJXMvZGV2LyVz
IGluIHVzZSwgY29udGludWUuLlxuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9fZnVuY19fLCBkZXZfbmFtZSgmdi0+ZGV2KSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIH0gd2hpbGUgKDEp
Owo+PiDCoCDCoMKgwqDCoMKgIHB1dF9kZXZpY2UoJnYtPmRldik7Cj4+ICvCoMKgwqAgdi0+ZGV2
X2ludmFsaWQgPSB0cnVlOwo+Cj4KPiBCZXNpZGVzIHRoZSBtYXBwaW5nIGhhbmRsaW5nIG1lbnRp
b25lZCBieSBNaWNoYWVsLiBJIHRoaW5rIHRoaXMgY2FuIAo+IGxlYWQgdXNlLWFmdGVyLWZyZWUu
IHB1dF9kZXZpY2UgbWF5IHJlbGVhc2UgdGhlIG1lbW9yeS4KPgo+IEFub3RoZXIgZnVuZGFtZW50
YWwgaXNzdWUsIHZEUEEgaXMgdGhlIHBhcmVudCBvZiB2aG9zdC12RFBBIGRldmljZS4gCj4gSSdt
IG5vdCBzdXJlIHRoZSBkZXZpY2UgY29yZSBjYW4gYWxsb3cgdGhlIHBhcmVudCB0byBnbyBhd2F5
IGZpcnN0LgoKCk9yIHRoaXMgcHJvYmFibHkgbWVhbnMgeW91IG5lZWQgY291cGxlIHRoZSBmZCBs
b29zZWx5IHdpdGggdGhlIAp2aG9zdC12RFBBIGRldmljZS4KClRoYW5rcwoKCj4KPiBUaGFua3MK
Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
