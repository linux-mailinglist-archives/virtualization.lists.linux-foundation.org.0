Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2F6AD78E
	for <lists.virtualization@lfdr.de>; Tue,  7 Mar 2023 07:43:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D29E80CDE;
	Tue,  7 Mar 2023 06:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D29E80CDE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O1ohok1z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 125w7mLRn7gI; Tue,  7 Mar 2023 06:43:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D710580BEE;
	Tue,  7 Mar 2023 06:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D710580BEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05739C0089;
	Tue,  7 Mar 2023 06:43:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B5C0C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 06:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A8D403EC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 06:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A8D403EC
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=O1ohok1z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdl6J0MejmaE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 06:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D21F40356
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D21F40356
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678171428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pezAhuR1uPalG5fyrsJ7QLVUPxn/PFGjGh0uAxYFYVU=;
 b=O1ohok1zKIjSL9Z0wBV8nn9aXKeyxyb1BoPuSEvmKbDvOlGsdAoOF3xUBGMdwGcCw4u+6s
 kQ8IPr5j5d0yaLT2+sBcwSSC2ML/g46tANx6p+MlFePauz//ctW9uFRJi5mQkXyZwDMexF
 Q3qq0inM0OX18UIzKF63PFhRtv+5V3E=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-4ONjHgppMMCLpvW09GybCg-1; Tue, 07 Mar 2023 01:43:47 -0500
X-MC-Unique: 4ONjHgppMMCLpvW09GybCg-1
Received: by mail-oi1-f200.google.com with SMTP id
 cb5-20020a056808320500b003848c5da32eso5044911oib.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Mar 2023 22:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678171427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pezAhuR1uPalG5fyrsJ7QLVUPxn/PFGjGh0uAxYFYVU=;
 b=MFqTt0ARw4Pmp42Goejq7iiz7URWZNbi7BJvgfXrSp0x7O2IocrG0kZMBoKgYsprN0
 /suuB6oHDV4/X7MJK+3tS5BU1JkjkhtHjDy7s6UIzgX8W+yhfOfGAqP2wwV+g2Y3i6A1
 jh88Q4BiAGwsn2LKs7Nx0GyEsHkk6R87GEmkYXYJb89Go5OBn8KpQwR6wlr8cDAx51Qb
 Xpd6O7INa4TtJfpvXNvUE+LRWA2eECXPWagBZrFrqdGOBBLtZabRfSIrmc1CJj9aHURc
 MsoHQ/cjyEiCTciIcp4bLGUOgMkv3YkvAq/VXrZKeux6k4KUmBeAdjnw7bfsiNUfHq45
 3l/Q==
X-Gm-Message-State: AO0yUKWnYEP+cl5VTpPcg0E0lu+xWbs8TwfbEH0Xm0FMECv4Shnq93Cy
 fWLLgPwjflN56lpmaMqG2UM6OLNISLXuxF1BylBvgLs5je533PBdhwCnbDdrCgCFAvZieUWCfnJ
 CaqvMjeRaP7FAKu3JeQsOEHmE/Df1Qu02i6LRkNZTcginAOqlcdD+3Ow1Jg==
X-Received: by 2002:a05:6870:c799:b0:176:3b36:3733 with SMTP id
 dy25-20020a056870c79900b001763b363733mr3813866oab.9.1678171426738; 
 Mon, 06 Mar 2023 22:43:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8ZonBxpuch0qRzS56FAVu4Ipcgtn+trapOO3cUayACh+fkpwKjx9ttHk7EaI1nLOKgkGzF4EmoZTqKPNuU5i0=
X-Received: by 2002:a05:6870:c799:b0:176:3b36:3733 with SMTP id
 dy25-20020a056870c79900b001763b363733mr3813860oab.9.1678171426481; Mon, 06
 Mar 2023 22:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20230302115908.1461-1-xuanzhuo@linux.alibaba.com>
 <20230302115908.1461-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230302115908.1461-2-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 7 Mar 2023 14:43:35 +0800
Message-ID: <CACGkMEsA-YnhNA-cJTOrpDMvAv61A2KEYSznNy4g8o=nZ+jvfw@mail.gmail.com>
Subject: Re: [PATCH vhost v1 01/12] virtio_ring: split: refactor
 virtqueue_add_split() for premapped
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCA3OjU54oCvUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51
eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNvbW1pdCBzcGxpdHMgdmlydHF1ZXVlX2Fk
ZF9zcGxpdCgpIHRvIHR3byBmdW5jdGlvbnMuIFRoZSBwdXJwb3NlCj4gb2Ygc3VjaCBzcGxpdHRp
bmcgaXMgdG8gc2VwYXJhdGUgRE1BIG9wZXJhdGlvbnMuCj4KPiBUaGUgZmlyc3QgZnVuY3Rpb24g
aW5jbHVkZXMgYWxsIGNvZGVzIHRoYXQgbWF5IGZhaWwgYmVmb3JlIHRoZSBETUEKPiBvcGVyYXRp
b24uIFRoZSBzdWJzZXF1ZW50IHBhcnQgaXMgdXNlZCBhcyB0aGUgc2Vjb25kIGZ1bmN0aW9uLgo+
Cj4gSW4gdGhpcyB3YXksIHdlIGNhbiBwZXJmb3JtIERNQSBvcGVyYXRpb25zIGluIHRoZSBtaWRk
bGUgb2YgdGhlIHR3bwo+IGZ1bmN0aW9ucy4gSWYgdGhlIGZpcnN0IGZ1bmN0aW9uIGZhaWxzLCB3
ZSBkbyBub3QgbmVlZCB0byBwZXJmb3JtIERNQQo+IG9wZXJhdGlvbnMuIElmIGl0IGlzIHByZW1h
cHBlZCwgd2UgY2FuIHBhc3MgdGhlIERNQSBvcGVyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBY
dWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3Zp
cnRpby92aXJ0aW9fcmluZy5jIHwgMTMxICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3JpbmcuYwo+IGluZGV4IDQxMTQ0YjUyNDZhOC4uMzAwNTg5M2VjYzYxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiArKysgYi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gQEAgLTUyMCw1NyArNTIwLDM4IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgaW50IHZpcnRxdWV1ZV9hZGRfZGVzY19zcGxpdChzdHJ1Y3QgdmlydHF1ZXVl
ICp2cSwKPiAgICAgICAgIHJldHVybiBuZXh0Owo+ICB9Cj4KPiAtc3RhdGljIGlubGluZSBpbnQg
dmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnc1tdLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRvdGFsX3Nn
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG91
dF9zZ3MsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgaW5fc2dzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
ZGF0YSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmcF90IGdmcCkKPiArLyog
bm90ZTogcmV0dXJuIE5VTEwgbWVhbnMgbm8gaW5kaXJlY3QgdGhhdCBpcyB2YWxpZC4gKi8KPiAr
c3RhdGljIHN0cnVjdCB2cmluZ19kZXNjICp2aXJ0cXVldWVfZ2V0X2Rlc2Nfc3BsaXQoc3RydWN0
IHZyaW5nX3ZpcnRxdWV1ZSAqdnEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRvdGFsX3NnLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvdXRfc2dz
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZv
aWQgKmRhdGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqY3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdmcF90IGdmcCkKPiAgewoKSSBkb24ndCBvYmplY3QgdG8gdGhlIGNoYW5n
ZXMgYnV0IEkgZG9uJ3Qgc2VlIG11Y2ggdmFsdWUgaW4gZmFjdG9yaW5nCnRoaXMgb3V0LCBzaW5j
ZSBpdCdzIG5vdCByZWxhdGVkIHRvIGFueSBkbWEgbWFwcGluZyBsb2dpYy4KCj4gLSAgICAgICBz
dHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+IC0gICAgICAgc3RydWN0
IHNjYXR0ZXJsaXN0ICpzZzsKPiAgICAgICAgIHN0cnVjdCB2cmluZ19kZXNjICpkZXNjOwo+IC0g
ICAgICAgdW5zaWduZWQgaW50IGksIG4sIGF2YWlsLCBkZXNjc191c2VkLCBwcmV2LCBlcnJfaWR4
Owo+IC0gICAgICAgaW50IGhlYWQ7Cj4gLSAgICAgICBib29sIGluZGlyZWN0Owo+IC0KPiAtICAg
ICAgIFNUQVJUX1VTRSh2cSk7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgZGVzY3NfdXNlZDsKPgo+
ICAgICAgICAgQlVHX09OKGRhdGEgPT0gTlVMTCk7Cj4gICAgICAgICBCVUdfT04oY3R4ICYmIHZx
LT5pbmRpcmVjdCk7Cj4KPiAtICAgICAgIGlmICh1bmxpa2VseSh2cS0+YnJva2VuKSkgewo+IC0g
ICAgICAgICAgICAgICBFTkRfVVNFKHZxKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87
Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAodW5saWtlbHkodnEtPmJyb2tlbikpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU8pOwo+Cj4gICAgICAgICBMQVNUX0FERF9USU1F
X1VQREFURSh2cSk7Cj4KPiAgICAgICAgIEJVR19PTih0b3RhbF9zZyA9PSAwKTsKPgo+IC0gICAg
ICAgaGVhZCA9IHZxLT5mcmVlX2hlYWQ7Cj4gLQo+ICAgICAgICAgaWYgKHZpcnRxdWV1ZV91c2Vf
aW5kaXJlY3QodnEsIHRvdGFsX3NnKSkKPiAtICAgICAgICAgICAgICAgZGVzYyA9IGFsbG9jX2lu
ZGlyZWN0X3NwbGl0KF92cSwgdG90YWxfc2csIGdmcCk7Cj4gKyAgICAgICAgICAgICAgIGRlc2Mg
PSBhbGxvY19pbmRpcmVjdF9zcGxpdCgmdnEtPnZxLCB0b3RhbF9zZywgZ2ZwKTsKPiAgICAgICAg
IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBkZXNjID0gTlVMTDsKPiAgICAgICAgICAgICAgICAg
V0FSTl9PTl9PTkNFKHRvdGFsX3NnID4gdnEtPnNwbGl0LnZyaW5nLm51bSAmJiAhdnEtPmluZGly
ZWN0KTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWYgKGRlc2MpIHsKPiAtICAgICAgICAgICAg
ICAgLyogVXNlIGEgc2luZ2xlIGJ1ZmZlciB3aGljaCBkb2Vzbid0IGNvbnRpbnVlICovCj4gLSAg
ICAgICAgICAgICAgIGluZGlyZWN0ID0gdHJ1ZTsKPiAtICAgICAgICAgICAgICAgLyogU2V0IHVw
IHJlc3QgdG8gdXNlIHRoaXMgaW5kaXJlY3QgdGFibGUuICovCj4gLSAgICAgICAgICAgICAgIGkg
PSAwOwo+ICsgICAgICAgaWYgKGRlc2MpCj4gICAgICAgICAgICAgICAgIGRlc2NzX3VzZWQgPSAx
Owo+IC0gICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgaW5kaXJlY3QgPSBmYWxzZTsK
PiAtICAgICAgICAgICAgICAgZGVzYyA9IHZxLT5zcGxpdC52cmluZy5kZXNjOwo+IC0gICAgICAg
ICAgICAgICBpID0gaGVhZDsKPiArICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgZGVzY3Nf
dXNlZCA9IHRvdGFsX3NnOwo+IC0gICAgICAgfQo+Cj4gICAgICAgICBpZiAodW5saWtlbHkodnEt
PnZxLm51bV9mcmVlIDwgZGVzY3NfdXNlZCkpIHsKPiAgICAgICAgICAgICAgICAgcHJfZGVidWco
IkNhbid0IGFkZCBidWYgbGVuICVpIC0gYXZhaWwgPSAlaVxuIiwKPiBAQCAtNTgwLDEwICs1NjEs
MzkgQEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1
ZXVlICpfdnEsCj4gICAgICAgICAgICAgICAgICAqIGhvc3Qgc2hvdWxkIHNlcnZpY2UgdGhlIHJp
bmcgQVNBUC4gKi8KPiAgICAgICAgICAgICAgICAgaWYgKG91dF9zZ3MpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgdnEtPm5vdGlmeSgmdnEtPnZxKTsKPiAtICAgICAgICAgICAgICAgaWYgKGlu
ZGlyZWN0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKGRlc2MpOwo+IC0gICAgICAg
ICAgICAgICBFTkRfVVNFKHZxKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4g
KyAgICAgICAgICAgICAgIGtmcmVlKGRlc2MpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJS
X1BUUigtRU5PU1BDKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gZGVzYzsKPiAr
fQo+ICsKPiArc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF92cmluZ19zcGxpdChzdHJ1
Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dzW10sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdG90YWxfc2csCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3V0
X3NncywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBpbl9zZ3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdnJpbmdfZGVzYyAqZGVzYykKPiArewo+ICsgICAgICAgc3RydWN0IHZpcnRx
dWV1ZSAqX3ZxID0gJnZxLT52cTsKPiArICAgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4g
KyAgICAgICB1bnNpZ25lZCBpbnQgaSwgbiwgYXZhaWwsIGRlc2NzX3VzZWQsIHByZXYsIGVycl9p
ZHg7Cj4gKyAgICAgICBpbnQgaGVhZDsKPiArICAgICAgIGJvb2wgaW5kaXJlY3Q7Cj4gKwo+ICsg
ICAgICAgaGVhZCA9IHZxLT5mcmVlX2hlYWQ7Cj4gKwo+ICsgICAgICAgaWYgKGRlc2MpIHsKPiAr
ICAgICAgICAgICAgICAgLyogVXNlIGEgc2luZ2xlIGJ1ZmZlciB3aGljaCBkb2Vzbid0IGNvbnRp
bnVlICovCj4gKyAgICAgICAgICAgICAgIGluZGlyZWN0ID0gdHJ1ZTsKPiArICAgICAgICAgICAg
ICAgLyogU2V0IHVwIHJlc3QgdG8gdXNlIHRoaXMgaW5kaXJlY3QgdGFibGUuICovCj4gKyAgICAg
ICAgICAgICAgIGkgPSAwOwo+ICsgICAgICAgICAgICAgICBkZXNjc191c2VkID0gMTsKPiArICAg
ICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIGluZGlyZWN0ID0gZmFsc2U7Cj4gKyAgICAg
ICAgICAgICAgIGRlc2MgPSB2cS0+c3BsaXQudnJpbmcuZGVzYzsKPiArICAgICAgICAgICAgICAg
aSA9IGhlYWQ7Cj4gKyAgICAgICAgICAgICAgIGRlc2NzX3VzZWQgPSB0b3RhbF9zZzsKPiAgICAg
ICAgIH0KPgo+ICAgICAgICAgZm9yIChuID0gMDsgbiA8IG91dF9zZ3M7IG4rKykgewo+IEBAIC02
NDgsMTMgKzY1OCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRxdWV1ZV9hZGRfc3BsaXQoc3Ry
dWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICB2cS0+
ZnJlZV9oZWFkID0gaTsKPgo+IC0gICAgICAgLyogU3RvcmUgdG9rZW4gYW5kIGluZGlyZWN0IGJ1
ZmZlciBzdGF0ZS4gKi8KPiAtICAgICAgIHZxLT5zcGxpdC5kZXNjX3N0YXRlW2hlYWRdLmRhdGEg
PSBkYXRhOwo+IC0gICAgICAgaWYgKGluZGlyZWN0KQo+IC0gICAgICAgICAgICAgICB2cS0+c3Bs
aXQuZGVzY19zdGF0ZVtoZWFkXS5pbmRpcl9kZXNjID0gZGVzYzsKPiAtICAgICAgIGVsc2UKPiAt
ICAgICAgICAgICAgICAgdnEtPnNwbGl0LmRlc2Nfc3RhdGVbaGVhZF0uaW5kaXJfZGVzYyA9IGN0
eDsKPiAtCj4gICAgICAgICAvKiBQdXQgZW50cnkgaW4gYXZhaWxhYmxlIGFycmF5IChidXQgZG9u
J3QgdXBkYXRlIGF2YWlsLT5pZHggdW50aWwgdGhleQo+ICAgICAgICAgICogZG8gc3luYykuICov
Cj4gICAgICAgICBhdmFpbCA9IHZxLT5zcGxpdC5hdmFpbF9pZHhfc2hhZG93ICYgKHZxLT5zcGxp
dC52cmluZy5udW0gLSAxKTsKPiBAQCAtNzAzLDYgKzcwNiw0OCBAQCBzdGF0aWMgaW5saW5lIGlu
dCB2aXJ0cXVldWVfYWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9z
cGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnc1tdLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRvdGFsX3NnLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG91dF9zZ3MsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaW5fc2dzLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmcF90IGdmcCkKPiArewo+ICsgICAgICAgc3RydWN0
IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiArICAgICAgIHN0cnVjdCB2cmlu
Z19kZXNjICpkZXNjOwo+ICsgICAgICAgaW50IGhlYWQ7Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsK
PiArICAgICAgIFNUQVJUX1VTRSh2cSk7Cj4gKwo+ICsgICAgICAgLyogY2hlY2sgdnEgc3RhdGUg
YW5kIHRyeSB0byBhbGxvYyBkZXNjIGZvciBpbmRpcmVjdC4gKi8KPiArICAgICAgIGRlc2MgPSB2
aXJ0cXVldWVfZ2V0X2Rlc2Nfc3BsaXQodnEsIHRvdGFsX3NnLCBvdXRfc2dzLCBkYXRhLCBjdHgs
IGdmcCk7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGRlc2MpKSB7Cj4gKyAgICAgICAgICAgICAgIGVy
ciA9IFBUUl9FUlIoZGVzYyk7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZW5kOwo+ICsgICAgICAg
fQo+ICsKPiArICAgICAgIGhlYWQgPSB2cS0+ZnJlZV9oZWFkOwo+ICsgICAgICAgZXJyID0gdmly
dHF1ZXVlX2FkZF92cmluZ19zcGxpdCh2cSwgc2dzLCB0b3RhbF9zZywgb3V0X3NncywgaW5fc2dz
LCBkZXNjKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+
ICsKPiArICAgICAgIC8qIFN0b3JlIHRva2VuIGFuZCBpbmRpcmVjdCBidWZmZXIgc3RhdGUuICov
Cj4gKyAgICAgICB2cS0+c3BsaXQuZGVzY19zdGF0ZVtoZWFkXS5kYXRhID0gZGF0YTsKPiArICAg
ICAgIHZxLT5zcGxpdC5kZXNjX3N0YXRlW2hlYWRdLmluZGlyX2Rlc2MgPSBkZXNjID8gZGVzYyA6
IGN0eDsKPiArCj4gKyAgICAgICBnb3RvIGVuZDsKCk5pdDogdGhpcyBzZWVtcyBub3QgZWxlZ2Fu
dC4gSSB3b3VsZCByYXRoZXIgZHVwbGljYXRlCgpFTkRfVVNFKHZxKTsKcmV0dXJuIGVycjsKCmhl
cmUuCgpUaGFua3MKCgoKCj4gKwo+ICtlcnI6Cj4gKyAgICAgICBrZnJlZShkZXNjKTsKPiArCj4g
K2VuZDoKPiArICAgICAgIEVORF9VU0UodnEpOwo+ICsgICAgICAgcmV0dXJuIGVycjsKPiArfQo+
ICsKPiAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2tpY2tfcHJlcGFyZV9zcGxpdChzdHJ1Y3Qgdmly
dHF1ZXVlICpfdnEpCj4gIHsKPiAgICAgICAgIHN0cnVjdCB2cmluZ192aXJ0cXVldWUgKnZxID0g
dG9fdnZxKF92cSk7Cj4gLS0KPiAyLjMyLjAuMy5nMDExOTVjZjlmCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
