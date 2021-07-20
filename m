Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7113CF272
	for <lists.virtualization@lfdr.de>; Tue, 20 Jul 2021 05:13:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3CC83054;
	Tue, 20 Jul 2021 03:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AT8CEaILrFBW; Tue, 20 Jul 2021 03:13:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A10C98305A;
	Tue, 20 Jul 2021 03:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E000C000E;
	Tue, 20 Jul 2021 03:13:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9736EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 03:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 718404023A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 03:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id if303jy5udJs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 03:13:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9442400E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 03:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626750787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoLEcT33LRgRDL/zFFgtY3SrFi92a7SIbwIG491oqAU=;
 b=TZ9y26hoA1kGNVSEQq2witH4pTK6mFVXEjbtkfKdmgmZGeY3L8hQ6lTpEINHLffKqP4WsQ
 0s/JpeGxnbV/DVQOrZTVxIyLqVxpp+igI0xHL9iyrVBK1Pq5+yKx9VEItkrAWRAN2rC9HQ
 Di076hTGO8RFBQAdeVfqmAcTAE5fhnA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-mnxnlYunN2eVj6NjHE5CHA-1; Mon, 19 Jul 2021 23:13:06 -0400
X-MC-Unique: mnxnlYunN2eVj6NjHE5CHA-1
Received: by mail-pf1-f199.google.com with SMTP id
 d8-20020a056a001988b02903468678ce14so4620683pfl.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 20:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DoLEcT33LRgRDL/zFFgtY3SrFi92a7SIbwIG491oqAU=;
 b=NkkRzzdz24JotuVuQcV3WD/CPGxOhqbOeJcPvXtXQJhw9cndDaneeIgSTAZKXdmvTe
 hBBnPvF9/t5ZDW2jGn2CRvtN+CWi3GPDv9zGlFm47nY5kcO/txAUWQx07VWF1lc8ugu9
 6vo3uzrACHI/w+oRrr7+GUJWnVHHV+5BBHmrzujpe1ngriAZv0tmtgkGx5vrs7gl++Gr
 SrkV95Rvj4FrEey/rh5/z/+h1wMJ7iz1ajMUErwDQ3z4PAsLV6jvlH1CiXnS0YIvb9l6
 kmtg4F0Pdn8zMC8y3+eNpeQ3gOiLoEsPnZXaxBBQcR1AgbEvnxzWzZjOuycZqnNa5oPQ
 aaCg==
X-Gm-Message-State: AOAM532EvnrjEUjiuVuqyy5Bnmx1mAAO6rwS7wr3KlNZFlFdZkd9i9wv
 tXO+/ISQcqWs4aCwTQ/MPI6kGH0lApf70EFzfip5GU3pyb6YQIips90VA4Z2yx2WLo1ACwuIpY8
 LE1gofgH3rkyVPoIVjuJQetttD3GEmwkBEdGQvPl/yA==
X-Received: by 2002:a17:902:ea07:b029:129:ade2:1b05 with SMTP id
 s7-20020a170902ea07b0290129ade21b05mr21629477plg.31.1626750784942; 
 Mon, 19 Jul 2021 20:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+4DvQ+yNCHTnf+mLnJP+rqdTfJp4hrhDj9VtzG/Y3UP2/HCHBpsXpxIocOrKbBFUaJ1HO4g==
X-Received: by 2002:a17:902:ea07:b029:129:ade2:1b05 with SMTP id
 s7-20020a170902ea07b0290129ade21b05mr21629458plg.31.1626750784644; 
 Mon, 19 Jul 2021 20:13:04 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x10sm13865584pfh.56.2021.07.19.20.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 20:13:04 -0700 (PDT)
Subject: Re: [PATCH] vdpa/vdpa_sim: Use the negotiated features when calling
 vringh_init_iotlb
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210719134407.175884-1-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <970569fc-80bc-b0ef-b163-c59650796515@redhat.com>
Date: Tue, 20 Jul 2021 11:13:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719134407.175884-1-elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

CtTaIDIwMjEvNy8xOSDPws7nOTo0NCwgRWxpIENvaGVuINC0tcA6Cj4gV2hlbiBjYWxsaW5nIHZy
aW5naF9pbml0X2lvdGxiKCksIHVzZSB0aGUgbmVnb3RpYXRlZCBmZWF0dXJlcyB3aGljaAo+IG1p
Z2h0IGJlIGRpZmZlcmVudCB0aGFuIHRoZSBzdXBwb3J0ZWQgZmVhdHVyZXMuCj4KPiBGaXhlczog
MDExYzM1YmFjNWVmICgidmRwYV9zaW06IGFkZCBzdXBwb3J0ZWRfZmVhdHVyZXMgZmllbGQgaW4g
dmRwYXNpbV9kZXZfYXR0cikKCgpBcyBTdGVmYW5vIHNhaWQuCgpJdCBzaG91bGQgYmUgMmM1M2Qw
ZjY0YzA2ZiAoInZkcGFzaW06IHZEUEEgZGV2aWNlIHNpbXVsYXRvciIpCgpPdGhlciB0aGFuIHRo
aXMKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4gU2lnbmVk
LW9mZi1ieTogRWxpIENvaGVuIDxlbGljQG52aWRpYS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zk
cGEvdmRwYV9zaW0vdmRwYV9zaW0uYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEv
dmRwYV9zaW0vdmRwYV9zaW0uYyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4g
aW5kZXggMTRlMDI0ZGU1Y2JmLi44OWE0NzRjN2EwOTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92
ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRw
YV9zaW0uYwo+IEBAIC02Niw3ICs2Niw3IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fcXVldWVfcmVh
ZHkoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0sIHVuc2lnbmVkIGludCBpZHgpCj4gICB7Cj4gICAJ
c3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSA9ICZ2ZHBhc2ltLT52cXNbaWR4XTsKPiAgIAo+
IC0JdnJpbmdoX2luaXRfaW90bGIoJnZxLT52cmluZywgdmRwYXNpbS0+ZGV2X2F0dHIuc3VwcG9y
dGVkX2ZlYXR1cmVzLAo+ICsJdnJpbmdoX2luaXRfaW90bGIoJnZxLT52cmluZywgdmRwYXNpbS0+
ZmVhdHVyZXMsCj4gICAJCQkgIFZEUEFTSU1fUVVFVUVfTUFYLCBmYWxzZSwKPiAgIAkJCSAgKHN0
cnVjdCB2cmluZ19kZXNjICopKHVpbnRwdHJfdCl2cS0+ZGVzY19hZGRyLAo+ICAgCQkJICAoc3Ry
dWN0IHZyaW5nX2F2YWlsICopCj4gQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGljIHZvaWQgdmRwYXNp
bV92cV9yZXNldChzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSwKPiAgIAl2cS0+ZGV2aWNlX2FkZHIg
PSAwOwo+ICAgCXZxLT5jYiA9IE5VTEw7Cj4gICAJdnEtPnByaXZhdGUgPSBOVUxMOwo+IC0JdnJp
bmdoX2luaXRfaW90bGIoJnZxLT52cmluZywgdmRwYXNpbS0+ZGV2X2F0dHIuc3VwcG9ydGVkX2Zl
YXR1cmVzLAo+ICsJdnJpbmdoX2luaXRfaW90bGIoJnZxLT52cmluZywgdmRwYXNpbS0+ZmVhdHVy
ZXMsCj4gICAJCQkgIFZEUEFTSU1fUVVFVUVfTUFYLCBmYWxzZSwgTlVMTCwgTlVMTCwgTlVMTCk7
Cj4gICAKPiAgIAl2cS0+dnJpbmcubm90aWZ5ID0gTlVMTDsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
