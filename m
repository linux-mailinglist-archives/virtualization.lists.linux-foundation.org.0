Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB406C5E90
	for <lists.virtualization@lfdr.de>; Thu, 23 Mar 2023 06:14:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A22E60FAE;
	Thu, 23 Mar 2023 05:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A22E60FAE
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tiz7CRGA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4R9qTOaQqrj; Thu, 23 Mar 2023 05:14:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 91A67613E1;
	Thu, 23 Mar 2023 05:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A67613E1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD575C007E;
	Thu, 23 Mar 2023 05:14:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C850AC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 05:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A916140612
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 05:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A916140612
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tiz7CRGA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPevzOw5DWds
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 05:14:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D1574011C
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D1574011C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 05:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679548484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2Jdqd/2gCdvIPf34/hVy9mCqJMpFikXBc+zmi+CxBg=;
 b=Tiz7CRGARXxLShg6YWyXNoqbkBMg6wYk5RyVXuHlXUQTm5wIeH8clq+1PaFkOQTioJaYtN
 LEIusPYtyIj8n2pWHSg4coU8CZV59UZz/7pf6vsymn1PZvEy7rfrZBCGEevU10JGXMLn/X
 WjHhAbeOpfPpMk3w0GesyRtSymUacP4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-DLy3sA--MNWCT3cqQ3yRgg-1; Thu, 23 Mar 2023 01:14:40 -0400
X-MC-Unique: DLy3sA--MNWCT3cqQ3yRgg-1
Received: by mail-ot1-f72.google.com with SMTP id
 j16-20020a9d7390000000b0069fa749a693so782666otk.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Mar 2023 22:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2Jdqd/2gCdvIPf34/hVy9mCqJMpFikXBc+zmi+CxBg=;
 b=V5r+/vYly/mdPf3lAJJEigv01Yc4bODa6gZEE8ui8NC1bVetKFBTi3vtRb63e5KKZ/
 Ru+HEfAgVS/IWwEkuQNnk1lMo2iY5kEXqld/yehixJDkwfQWwoKrtuMMObB48yHJ8GkP
 XpoThVD3a/yIrPCFQ2PbvR8xYmON6z0ql3KyULtPvf+zolZ3BbXTS0twxtp18X3P0WFW
 6h90L9VU0bCXoAAxbQOTo2FPIv6mJo/+tsc4KlbAalyGkx7pfupndkXd5HpdPEBVM9n3
 tSmIwbirYOZYYsKmCiNsSfgmYvR86kPoLqOqsvSi/0NmmUAlA2O3GWoZSzkcE5Laz5Z0
 U/gA==
X-Gm-Message-State: AO0yUKWqn3D68P97fuHhfhm0eHmKKBPG4e2vC4leinDnoCT7H8AV/si8
 EfI9uJiUYvaPy1BPtzW5M7VI81QWfVM8q/LeUTjNunUICNihVZjE5GfmjXDaupu2FQuxVlixAoB
 Xi5QtHJqwaRVIgSg2u/Cm3ebWTXfPvLaRiPBo+jh43eY/aCu6qGrtojrV2A==
X-Received: by 2002:a05:6870:f915:b0:177:ca1c:2ca8 with SMTP id
 ao21-20020a056870f91500b00177ca1c2ca8mr747265oac.9.1679548479603; 
 Wed, 22 Mar 2023 22:14:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set9gczklWHhnh6A0gS6ubekKff3AvmKRfZG9kbinQCT3wo9Kk5nuhWo0YcOyoN5m4BsRibRG2B8CqyoQLUftsbM=
X-Received: by 2002:a05:6870:f915:b0:177:ca1c:2ca8 with SMTP id
 ao21-20020a056870f91500b00177ca1c2ca8mr747251oac.9.1679548479278; Wed, 22 Mar
 2023 22:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230322191038.44037-1-shannon.nelson@amd.com>
 <20230322191038.44037-6-shannon.nelson@amd.com>
In-Reply-To: <20230322191038.44037-6-shannon.nelson@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 23 Mar 2023 13:14:28 +0800
Message-ID: <CACGkMEt4m-g1OFyD9rF8Zjepgg7xUPJxYk8e__67_TD_NKzkcA@mail.gmail.com>
Subject: Re: [PATCH v3 virtio 5/8] pds_vdpa: add vdpa config client commands
To: Shannon Nelson <shannon.nelson@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: brett.creeley@amd.com, mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kuba@kernel.org,
 drivers@pensando.io, davem@davemloft.net
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMzoxMeKAr0FNIFNoYW5ub24gTmVsc29uIDxzaGFubm9u
Lm5lbHNvbkBhbWQuY29tPiB3cm90ZToKPgo+IFRoZXNlIGFyZSB0aGUgYWRtaW5xIGNvbW1hbmRz
IHRoYXQgd2lsbCBiZSBuZWVkZWQgZm9yCj4gc2V0dGluZyB1cCBhbmQgdXNpbmcgdGhlIHZEUEEg
ZGV2aWNlLiAgVGhlcmUgYXJlIGEgbnVtYmVyCj4gb2YgY29tbWFuZHMgZGVmaW5lZCBpbiB0aGUg
RlcncyBBUEksIGJ1dCBieSBtYWtpbmcgdXNlIG9mCj4gdGhlIEZXJ3MgdmlydGlvIEJBUiB3ZSBv
bmx5IG5lZWQgYSBmZXcgb2YgdGhlc2UgY29tbWFuZHMKPiBmb3IgdkRQQSBzdXBwb3J0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogU2hhbm5vbiBOZWxzb24gPHNoYW5ub24ubmVsc29uQGFtZC5jb20+CgpB
Y2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KClRoYW5rcwoKPiAtLS0K
PiAgZHJpdmVycy92ZHBhL3Bkcy9NYWtlZmlsZSAgICB8ICAgMSArCj4gIGRyaXZlcnMvdmRwYS9w
ZHMvY21kcy5jICAgICAgfCAxNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgZHJpdmVycy92ZHBhL3Bkcy9jbWRzLmggICAgICB8ICAxNiArKysrCj4gIGRyaXZlcnMvdmRw
YS9wZHMvdmRwYV9kZXYuaCAgfCAgMzMgKysrKysrLQo+ICBpbmNsdWRlL2xpbnV4L3Bkcy9wZHNf
dmRwYS5oIHwgMTc1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxl
cyBjaGFuZ2VkLCA0MDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy92ZHBhL3Bkcy9jbWRzLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvdmRwYS9wZHMvY21kcy5oCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3Bkcy9N
YWtlZmlsZSBiL2RyaXZlcnMvdmRwYS9wZHMvTWFrZWZpbGUKPiBpbmRleCAxM2I1MDM5NGVjNjQu
LjJlMjI0MThlM2FiMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvcGRzL01ha2VmaWxlCj4g
KysrIGIvZHJpdmVycy92ZHBhL3Bkcy9NYWtlZmlsZQo+IEBAIC00LDYgKzQsNyBAQAo+ICBvYmot
JChDT05GSUdfUERTX1ZEUEEpIDo9IHBkc192ZHBhLm8KPgo+ICBwZHNfdmRwYS15IDo9IGF1eF9k
cnYubyBcCj4gKyAgICAgICAgICAgICBjbWRzLm8gXAo+ICAgICAgICAgICAgICAgdmRwYV9kZXYu
bwo+Cj4gIHBkc192ZHBhLSQoQ09ORklHX0RFQlVHX0ZTKSArPSBkZWJ1Z2ZzLm8KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZHBhL3Bkcy9jbWRzLmMgYi9kcml2ZXJzL3ZkcGEvcGRzL2NtZHMuYwo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iODQ3ZDcwOGU0Y2MK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy92ZHBhL3Bkcy9jbWRzLmMKPiBAQCAtMCww
ICsxLDE3OCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4g
Ky8qIENvcHlyaWdodChjKSAyMDIzIEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYyAqLwo+ICsK
PiArI2luY2x1ZGUgPGxpbnV4L3ZkcGEuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19wY2lf
bW9kZXJuLmg+Cj4gKwo+ICsjaW5jbHVkZSA8bGludXgvcGRzL3Bkc19jb21tb24uaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L3Bkcy9wZHNfY29yZV9pZi5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGRzL3Bk
c19hZG1pbnEuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Bkcy9wZHNfYXV4YnVzLmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9wZHMvcGRzX3ZkcGEuaD4KPiArCj4gKyNpbmNsdWRlICJ2ZHBhX2Rldi5oIgo+
ICsjaW5jbHVkZSAiYXV4X2Rydi5oIgo+ICsjaW5jbHVkZSAiY21kcy5oIgo+ICsKPiAraW50IHBk
c192ZHBhX2luaXRfaHcoc3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdikKPiArewo+ICsgICAg
ICAgc3RydWN0IHBkc19hdXhpbGlhcnlfZGV2ICpwYWRldiA9IHBkc3YtPnZkcGFfYXV4LT5wYWRl
djsKPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwYWRldi0+YXV4X2Rldi5kZXY7Cj4g
KyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfaW5pdF9jbWQgaW5pdF9jbWQgPSB7Cj4gKyAgICAgICAg
ICAgICAgIC5vcGNvZGUgPSBQRFNfVkRQQV9DTURfSU5JVCwKPiArICAgICAgICAgICAgICAgLnZk
cGFfaW5kZXggPSBwZHN2LT52ZHBhX2luZGV4LAo+ICsgICAgICAgICAgICAgICAudmZfaWQgPSBj
cHVfdG9fbGUxNihwZHN2LT52ZHBhX2F1eC0+dmZfaWQpLAo+ICsgICAgICAgfTsKPiArICAgICAg
IHN0cnVjdCBwZHNfdmRwYV9jb21wIGluaXRfY29tcCA9IHswfTsKPiArICAgICAgIGludCBlcnI7
Cj4gKwo+ICsgICAgICAgLyogSW5pdGlhbGl6ZSB0aGUgdmRwYS92aXJ0aW8gZGV2aWNlICovCj4g
KyAgICAgICBlcnIgPSBwYWRldi0+b3BzLT5hZG1pbnFfY21kKHBhZGV2LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2NtZCAqKSZp
bml0X2NtZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGlu
aXRfY21kKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuaW9uIHBk
c19jb3JlX2FkbWlucV9jb21wICopJmluaXRfY29tcCwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICBk
ZXZfZGJnKGRldiwgIkZhaWxlZCB0byBpbml0IGh3LCBzdGF0dXMgJWQ6ICVwZVxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICBpbml0X2NvbXAuc3RhdHVzLCBFUlJfUFRSKGVycikpOwo+ICsK
PiArICAgICAgIHJldHVybiBlcnI7Cj4gK30KPiArCj4gK2ludCBwZHNfdmRwYV9jbWRfcmVzZXQo
c3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdikKPiArewo+ICsgICAgICAgc3RydWN0IHBkc19h
dXhpbGlhcnlfZGV2ICpwYWRldiA9IHBkc3YtPnZkcGFfYXV4LT5wYWRldjsKPiArICAgICAgIHN0
cnVjdCBkZXZpY2UgKmRldiA9ICZwYWRldi0+YXV4X2Rldi5kZXY7Cj4gKyAgICAgICBzdHJ1Y3Qg
cGRzX3ZkcGFfY21kIGNtZCA9IHsKPiArICAgICAgICAgICAgICAgLm9wY29kZSA9IFBEU19WRFBB
X0NNRF9SRVNFVCwKPiArICAgICAgICAgICAgICAgLnZkcGFfaW5kZXggPSBwZHN2LT52ZHBhX2lu
ZGV4LAo+ICsgICAgICAgICAgICAgICAudmZfaWQgPSBjcHVfdG9fbGUxNihwZHN2LT52ZHBhX2F1
eC0+dmZfaWQpLAo+ICsgICAgICAgfTsKPiArICAgICAgIHN0cnVjdCBwZHNfdmRwYV9jb21wIGNv
bXAgPSB7MH07Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsKPiArICAgICAgIGVyciA9IHBhZGV2LT5v
cHMtPmFkbWlucV9jbWQocGFkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICh1bmlvbiBwZHNfY29yZV9hZG1pbnFfY21kICopJmNtZCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGNtZCksCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh1bmlvbiBwZHNfY29yZV9hZG1pbnFfY29tcCAqKSZjb21wLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwKTsKPiArICAgICAgIGlmIChlcnIp
Cj4gKyAgICAgICAgICAgICAgIGRldl9kYmcoZGV2LCAiRmFpbGVkIHRvIHJlc2V0IGh3LCBzdGF0
dXMgJWQ6ICVwZVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wLnN0YXR1cywgRVJS
X1BUUihlcnIpKTsKPiArCj4gKyAgICAgICByZXR1cm4gZXJyOwo+ICt9Cj4gKwo+ICtpbnQgcGRz
X3ZkcGFfY21kX3NldF9tYWMoc3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdiwgdTggKm1hYykK
PiArewo+ICsgICAgICAgc3RydWN0IHBkc19hdXhpbGlhcnlfZGV2ICpwYWRldiA9IHBkc3YtPnZk
cGFfYXV4LT5wYWRldjsKPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwYWRldi0+YXV4
X2Rldi5kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfc2V0YXR0cl9jbWQgY21kID0gewo+
ICsgICAgICAgICAgICAgICAub3Bjb2RlID0gUERTX1ZEUEFfQ01EX1NFVF9BVFRSLAo+ICsgICAg
ICAgICAgICAgICAudmRwYV9pbmRleCA9IHBkc3YtPnZkcGFfaW5kZXgsCj4gKyAgICAgICAgICAg
ICAgIC52Zl9pZCA9IGNwdV90b19sZTE2KHBkc3YtPnZkcGFfYXV4LT52Zl9pZCksCj4gKyAgICAg
ICAgICAgICAgIC5hdHRyID0gUERTX1ZEUEFfQVRUUl9NQUMsCj4gKyAgICAgICB9Owo+ICsgICAg
ICAgc3RydWN0IHBkc192ZHBhX2NvbXAgY29tcCA9IHswfTsKPiArICAgICAgIGludCBlcnI7Cj4g
Kwo+ICsgICAgICAgZXRoZXJfYWRkcl9jb3B5KGNtZC5tYWMsIG1hYyk7Cj4gKyAgICAgICBlcnIg
PSBwYWRldi0+b3BzLT5hZG1pbnFfY21kKHBhZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2NtZCAqKSZjbWQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihjbWQpLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2NvbXAgKikm
Y29tcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7Cj4gKyAgICAg
ICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgIkZhaWxlZCB0byBzZXQg
bWFjIGFkZHJlc3MgJXBNLCBzdGF0dXMgJWQ6ICVwZVxuIiwKPiArICAgICAgICAgICAgICAgICAg
ICAgICBtYWMsIGNvbXAuc3RhdHVzLCBFUlJfUFRSKGVycikpOwo+ICsKPiArICAgICAgIHJldHVy
biBlcnI7Cj4gK30KPiArCj4gK2ludCBwZHNfdmRwYV9jbWRfc2V0X21heF92cV9wYWlycyhzdHJ1
Y3QgcGRzX3ZkcGFfZGV2aWNlICpwZHN2LCB1MTYgbWF4X3ZxcCkKPiArewo+ICsgICAgICAgc3Ry
dWN0IHBkc19hdXhpbGlhcnlfZGV2ICpwYWRldiA9IHBkc3YtPnZkcGFfYXV4LT5wYWRldjsKPiAr
ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwYWRldi0+YXV4X2Rldi5kZXY7Cj4gKyAgICAg
ICBzdHJ1Y3QgcGRzX3ZkcGFfc2V0YXR0cl9jbWQgY21kID0gewo+ICsgICAgICAgICAgICAgICAu
b3Bjb2RlID0gUERTX1ZEUEFfQ01EX1NFVF9BVFRSLAo+ICsgICAgICAgICAgICAgICAudmRwYV9p
bmRleCA9IHBkc3YtPnZkcGFfaW5kZXgsCj4gKyAgICAgICAgICAgICAgIC52Zl9pZCA9IGNwdV90
b19sZTE2KHBkc3YtPnZkcGFfYXV4LT52Zl9pZCksCj4gKyAgICAgICAgICAgICAgIC5hdHRyID0g
UERTX1ZEUEFfQVRUUl9NQVhfVlFfUEFJUlMsCj4gKyAgICAgICAgICAgICAgIC5tYXhfdnFfcGFp
cnMgPSBjcHVfdG9fbGUxNihtYXhfdnFwKSwKPiArICAgICAgIH07Cj4gKyAgICAgICBzdHJ1Y3Qg
cGRzX3ZkcGFfY29tcCBjb21wID0gezB9Owo+ICsgICAgICAgaW50IGVycjsKPiArCj4gKyAgICAg
ICBlcnIgPSBwYWRldi0+b3BzLT5hZG1pbnFfY21kKHBhZGV2LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2NtZCAqKSZjbWQsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihjbWQpLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2Nv
bXAgKikmY29tcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7Cj4g
KyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgIkZhaWxlZCB0
byBzZXQgbWF4IHZxIHBhaXJzICV1LCBzdGF0dXMgJWQ6ICVwZVxuIiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICBtYXhfdnFwLCBjb21wLnN0YXR1cywgRVJSX1BUUihlcnIpKTsKPiArCj4gKyAg
ICAgICByZXR1cm4gZXJyOwo+ICt9Cj4gKwo+ICtpbnQgcGRzX3ZkcGFfY21kX2luaXRfdnEoc3Ry
dWN0IHBkc192ZHBhX2RldmljZSAqcGRzdiwgdTE2IHFpZCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHBkc192ZHBhX3ZxX2luZm8gKnZxX2luZm8pCj4gK3sKPiArICAgICAgIHN0
cnVjdCBwZHNfYXV4aWxpYXJ5X2RldiAqcGFkZXYgPSBwZHN2LT52ZHBhX2F1eC0+cGFkZXY7Cj4g
KyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGFkZXYtPmF1eF9kZXYuZGV2Owo+ICsgICAg
ICAgc3RydWN0IHBkc192ZHBhX3ZxX2luaXRfY29tcCBjb21wID0gezB9Owo+ICsgICAgICAgc3Ry
dWN0IHBkc192ZHBhX3ZxX2luaXRfY21kIGNtZCA9IHsKPiArICAgICAgICAgICAgICAgLm9wY29k
ZSA9IFBEU19WRFBBX0NNRF9WUV9JTklULAo+ICsgICAgICAgICAgICAgICAudmRwYV9pbmRleCA9
IHBkc3YtPnZkcGFfaW5kZXgsCj4gKyAgICAgICAgICAgICAgIC52Zl9pZCA9IGNwdV90b19sZTE2
KHBkc3YtPnZkcGFfYXV4LT52Zl9pZCksCj4gKyAgICAgICAgICAgICAgIC5xaWQgPSBjcHVfdG9f
bGUxNihxaWQpLAo+ICsgICAgICAgICAgICAgICAubGVuID0gY3B1X3RvX2xlMTYoaWxvZzIodnFf
aW5mby0+cV9sZW4pKSwKPiArICAgICAgICAgICAgICAgLmRlc2NfYWRkciA9IGNwdV90b19sZTY0
KHZxX2luZm8tPmRlc2NfYWRkciksCj4gKyAgICAgICAgICAgICAgIC5hdmFpbF9hZGRyID0gY3B1
X3RvX2xlNjQodnFfaW5mby0+YXZhaWxfYWRkciksCj4gKyAgICAgICAgICAgICAgIC51c2VkX2Fk
ZHIgPSBjcHVfdG9fbGU2NCh2cV9pbmZvLT51c2VkX2FkZHIpLAo+ICsgICAgICAgICAgICAgICAu
aW50cl9pbmRleCA9IGNwdV90b19sZTE2KHFpZCksCj4gKyAgICAgICB9Owo+ICsgICAgICAgaW50
IGVycjsKPiArCj4gKyAgICAgICBkZXZfZGJnKGRldiwgIiVzOiBxaWQgJWQgbGVuICVkIGRlc2Nf
YWRkciAlI2xseCBhdmFpbF9hZGRyICUjbGx4IHVzZWRfYWRkciAlI2xseFxuIiwKPiArICAgICAg
ICAgICAgICAgX19mdW5jX18sIHFpZCwgaWxvZzIodnFfaW5mby0+cV9sZW4pLAo+ICsgICAgICAg
ICAgICAgICB2cV9pbmZvLT5kZXNjX2FkZHIsIHZxX2luZm8tPmF2YWlsX2FkZHIsIHZxX2luZm8t
PnVzZWRfYWRkcik7Cj4gKwo+ICsgICAgICAgZXJyID0gcGFkZXYtPm9wcy0+YWRtaW5xX2NtZChw
YWRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuaW9uIHBkc19j
b3JlX2FkbWlucV9jbWQgKikmY21kLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YoY21kKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KHVuaW9uIHBkc19jb3JlX2FkbWlucV9jb21wICopJmNvbXAsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDApOwo+ICsgICAgICAgaWYgKGVycikgewo+ICsgICAgICAgICAg
ICAgICBkZXZfZGJnKGRldiwgIkZhaWxlZCB0byBpbml0IHZxICVkLCBzdGF0dXMgJWQ6ICVwZVxu
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICBxaWQsIGNvbXAuc3RhdHVzLCBFUlJfUFRSKGVy
cikpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsgICAgICAgfQo+ICsKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtpbnQgcGRzX3ZkcGFfY21kX3Jlc2V0X3ZxKHN0cnVj
dCBwZHNfdmRwYV9kZXZpY2UgKnBkc3YsIHUxNiBxaWQpCj4gK3sKPiArICAgICAgIHN0cnVjdCBw
ZHNfYXV4aWxpYXJ5X2RldiAqcGFkZXYgPSBwZHN2LT52ZHBhX2F1eC0+cGFkZXY7Cj4gKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGFkZXYtPmF1eF9kZXYuZGV2Owo+ICsgICAgICAgc3Ry
dWN0IHBkc192ZHBhX3ZxX3Jlc2V0X2NtZCBjbWQgPSB7Cj4gKyAgICAgICAgICAgICAgIC5vcGNv
ZGUgPSBQRFNfVkRQQV9DTURfVlFfUkVTRVQsCj4gKyAgICAgICAgICAgICAgIC52ZHBhX2luZGV4
ID0gcGRzdi0+dmRwYV9pbmRleCwKPiArICAgICAgICAgICAgICAgLnZmX2lkID0gY3B1X3RvX2xl
MTYocGRzdi0+dmRwYV9hdXgtPnZmX2lkKSwKPiArICAgICAgICAgICAgICAgLnFpZCA9IGNwdV90
b19sZTE2KHFpZCksCj4gKyAgICAgICB9Owo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX2NvbXAg
Y29tcCA9IHswfTsKPiArICAgICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgZXJyID0gcGFkZXYt
Pm9wcy0+YWRtaW5xX2NtZChwYWRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHVuaW9uIHBkc19jb3JlX2FkbWlucV9jbWQgKikmY21kLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoY21kKSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKHVuaW9uIHBkc19jb3JlX2FkbWlucV9jb21wICopJmNvbXAsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDApOwo+ICsgICAgICAgaWYgKGVy
cikKPiArICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICJGYWlsZWQgdG8gcmVzZXQgdnEgJWQs
IHN0YXR1cyAlZDogJXBlXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHFpZCwgY29tcC5z
dGF0dXMsIEVSUl9QVFIoZXJyKSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGVycjsKPiArfQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvcGRzL2NtZHMuaCBiL2RyaXZlcnMvdmRwYS9wZHMvY21k
cy5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjcyZTE5ZjRl
ZmRlNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL3ZkcGEvcGRzL2NtZHMuaAo+IEBA
IC0wLDAgKzEsMTYgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSAqLwo+ICsvKiBDb3B5cmlnaHQoYykgMjAyMyBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMg
Ki8KPiArCj4gKyNpZm5kZWYgX1ZEUEFfQ01EU19IXwo+ICsjZGVmaW5lIF9WRFBBX0NNRFNfSF8K
PiArCj4gK2ludCBwZHNfdmRwYV9pbml0X2h3KHN0cnVjdCBwZHNfdmRwYV9kZXZpY2UgKnBkc3Yp
Owo+ICsKPiAraW50IHBkc192ZHBhX2NtZF9yZXNldChzdHJ1Y3QgcGRzX3ZkcGFfZGV2aWNlICpw
ZHN2KTsKPiAraW50IHBkc192ZHBhX2NtZF9zZXRfbWFjKHN0cnVjdCBwZHNfdmRwYV9kZXZpY2Ug
KnBkc3YsIHU4ICptYWMpOwo+ICtpbnQgcGRzX3ZkcGFfY21kX3NldF9tYXhfdnFfcGFpcnMoc3Ry
dWN0IHBkc192ZHBhX2RldmljZSAqcGRzdiwgdTE2IG1heF92cXApOwo+ICtpbnQgcGRzX3ZkcGFf
Y21kX2luaXRfdnEoc3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdiwgdTE2IHFpZCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBkc192ZHBhX3ZxX2luZm8gKnZxX2luZm8pOwo+
ICtpbnQgcGRzX3ZkcGFfY21kX3Jlc2V0X3ZxKHN0cnVjdCBwZHNfdmRwYV9kZXZpY2UgKnBkc3Ys
IHUxNiBxaWQpOwo+ICtpbnQgcGRzX3ZkcGFfY21kX3NldF9mZWF0dXJlcyhzdHJ1Y3QgcGRzX3Zk
cGFfZGV2aWNlICpwZHN2LCB1NjQgZmVhdHVyZXMpOwo+ICsjZW5kaWYgLyogX1ZEUEFfQ01EU19I
XyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvcGRzL3ZkcGFfZGV2LmggYi9kcml2ZXJz
L3ZkcGEvcGRzL3ZkcGFfZGV2LmgKPiBpbmRleCA5N2ZhYjgzM2EwYWEuLmEyMTU5NmY0MzhjMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvcGRzL3ZkcGFfZGV2LmgKPiArKysgYi9kcml2ZXJz
L3ZkcGEvcGRzL3ZkcGFfZGV2LmgKPiBAQCAtNCwxMSArNCw0MiBAQAo+ICAjaWZuZGVmIF9WRFBB
X0RFVl9IXwo+ICAjZGVmaW5lIF9WRFBBX0RFVl9IXwo+Cj4gLSNkZWZpbmUgUERTX1ZEUEFfTUFY
X1FVRVVFUyAgICA2NQo+ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC92ZHBhLmg+Cj4gKwo+ICtzdHJ1Y3QgcGRzX3ZkcGFfdnFfaW5mbyB7Cj4gKyAgICAgICBib29s
IHJlYWR5Owo+ICsgICAgICAgdTY0IGRlc2NfYWRkcjsKPiArICAgICAgIHU2NCBhdmFpbF9hZGRy
Owo+ICsgICAgICAgdTY0IHVzZWRfYWRkcjsKPiArICAgICAgIHUzMiBxX2xlbjsKPiArICAgICAg
IHUxNiBxaWQ7Cj4gKyAgICAgICBpbnQgaXJxOwo+ICsgICAgICAgY2hhciBpcnFfbmFtZVszMl07
Cj4gKwo+ICsgICAgICAgdm9pZCBfX2lvbWVtICpub3RpZnk7Cj4gKyAgICAgICBkbWFfYWRkcl90
IG5vdGlmeV9wYTsKPiArCj4gKyAgICAgICB1NjQgZG9vcmJlbGw7Cj4gKyAgICAgICB1MTYgYXZh
aWxfaWR4Owo+ICsgICAgICAgdTE2IHVzZWRfaWR4Owo+Cj4gKyAgICAgICBzdHJ1Y3QgdmRwYV9j
YWxsYmFjayBldmVudF9jYjsKPiArICAgICAgIHN0cnVjdCBwZHNfdmRwYV9kZXZpY2UgKnBkc3Y7
Cj4gK307Cj4gKwo+ICsjZGVmaW5lIFBEU19WRFBBX01BWF9RVUVVRVMgICAgNjUKPiArI2RlZmlu
ZSBQRFNfVkRQQV9NQVhfUUxFTiAgICAgIDMyNzY4Cj4gIHN0cnVjdCBwZHNfdmRwYV9kZXZpY2Ug
ewo+ICAgICAgICAgc3RydWN0IHZkcGFfZGV2aWNlIHZkcGFfZGV2Owo+ICAgICAgICAgc3RydWN0
IHBkc192ZHBhX2F1eCAqdmRwYV9hdXg7Cj4gKwo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX3Zx
X2luZm8gdnFzW1BEU19WRFBBX01BWF9RVUVVRVNdOwo+ICsgICAgICAgdTY0IHJlcV9mZWF0dXJl
czsgICAgICAgICAgICAgICAvKiBmZWF0dXJlcyByZXF1ZXN0ZWQgYnkgdmRwYSAqLwo+ICsgICAg
ICAgdTY0IGFjdHVhbF9mZWF0dXJlczsgICAgICAgICAgICAvKiBmZWF0dXJlcyBuZWdvdGlhdGVk
IGFuZCBpbiB1c2UgKi8KPiArICAgICAgIHU4IHZkcGFfaW5kZXg7ICAgICAgICAgICAgICAgICAg
LyogcnN2ZCBmb3IgZnV0dXJlIHN1YmRldmljZSB1c2UgKi8KPiArICAgICAgIHU4IG51bV92cXM7
ICAgICAgICAgICAgICAgICAgICAgLyogbnVtIHZxcyBpbiB1c2UgKi8KPiArICAgICAgIHN0cnVj
dCB2ZHBhX2NhbGxiYWNrIGNvbmZpZ19jYjsKPiAgfTsKPgo+ICBpbnQgcGRzX3ZkcGFfZ2V0X21n
bXRfaW5mbyhzdHJ1Y3QgcGRzX3ZkcGFfYXV4ICp2ZHBhX2F1eCk7Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvcGRzL3Bkc192ZHBhLmggYi9pbmNsdWRlL2xpbnV4L3Bkcy9wZHNfdmRwYS5o
Cj4gaW5kZXggYzFkNmEzZmUyZDYxLi43ODU5MDlhNmRhZjYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9wZHMvcGRzX3ZkcGEuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGRzL3Bkc192ZHBh
LmgKPiBAQCAtOTcsNCArOTcsMTc5IEBAIHN0cnVjdCBwZHNfdmRwYV9pZGVudF9jbWQgewo+ICAg
ICAgICAgX19sZTMyIGxlbjsKPiAgICAgICAgIF9fbGU2NCBpZGVudF9wYTsKPiAgfTsKPiArCj4g
Ky8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfc3RhdHVzX2NtZCAtIFNUQVRVU19VUERBVEUgY29t
bWFuZAo+ICsgKiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1NUQVRVU19VUERBVEUK
PiArICogQHZkcGFfaW5kZXg6IEluZGV4IGZvciB2ZHBhIHN1YmRldmljZQo+ICsgKiBAdmZfaWQ6
ICAgICBWRiBpZAo+ICsgKiBAc3RhdHVzOiAgICBuZXcgc3RhdHVzIGJpdHMKPiArICovCj4gK3N0
cnVjdCBwZHNfdmRwYV9zdGF0dXNfY21kIHsKPiArICAgICAgIHU4ICAgICBvcGNvZGU7Cj4gKyAg
ICAgICB1OCAgICAgdmRwYV9pbmRleDsKPiArICAgICAgIF9fbGUxNiB2Zl9pZDsKPiArICAgICAg
IHU4ICAgICBzdGF0dXM7Cj4gK307Cj4gKwo+ICsvKioKPiArICogZW51bSBwZHNfdmRwYV9hdHRy
IC0gTGlzdCBvZiBWRFBBIGRldmljZSBhdHRyaWJ1dGVzCj4gKyAqIEBQRFNfVkRQQV9BVFRSX01B
QzogICAgICAgICAgTUFDIGFkZHJlc3MKPiArICogQFBEU19WRFBBX0FUVFJfTUFYX1ZRX1BBSVJT
OiBNYXggdmlydHF1ZXVlIHBhaXJzCj4gKyAqLwo+ICtlbnVtIHBkc192ZHBhX2F0dHIgewo+ICsg
ICAgICAgUERTX1ZEUEFfQVRUUl9NQUMgICAgICAgICAgPSAxLAo+ICsgICAgICAgUERTX1ZEUEFf
QVRUUl9NQVhfVlFfUEFJUlMgPSAyLAo+ICt9Owo+ICsKPiArLyoqCj4gKyAqIHN0cnVjdCBwZHNf
dmRwYV9zZXRhdHRyX2NtZCAtIFNFVF9BVFRSIGNvbW1hbmQKPiArICogQG9wY29kZTogICAgICAg
ICAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1NFVF9BVFRSCj4gKyAqIEB2ZHBhX2luZGV4OiAgICAg
ICAgICAgICAgICBJbmRleCBmb3IgdmRwYSBzdWJkZXZpY2UKPiArICogQHZmX2lkOiAgICAgICAg
ICAgICBWRiBpZAo+ICsgKiBAYXR0cjogICAgICAgICAgICAgIGF0dHJpYnV0ZSB0byBiZSBjaGFu
Z2VkIChlbnVtIHBkc192ZHBhX2F0dHIpCj4gKyAqIEBwYWQ6ICAgICAgICAgICAgICAgV29yZCBi
b3VuZGFyeSBwYWRkaW5nCj4gKyAqIEBtYWM6ICAgICAgICAgICAgICAgbmV3IG1hYyBhZGRyZXNz
IHRvIGJlIGFzc2lnbmVkIGFzIHZkcGEgZGV2aWNlIGFkZHJlc3MKPiArICogQG1heF92cV9wYWly
czogICAgICBuZXcgbGltaXQgb2YgdmlydHF1ZXVlIHBhaXJzCj4gKyAqLwo+ICtzdHJ1Y3QgcGRz
X3ZkcGFfc2V0YXR0cl9jbWQgewo+ICsgICAgICAgdTggICAgIG9wY29kZTsKPiArICAgICAgIHU4
ICAgICB2ZHBhX2luZGV4Owo+ICsgICAgICAgX19sZTE2IHZmX2lkOwo+ICsgICAgICAgdTggICAg
IGF0dHI7Cj4gKyAgICAgICB1OCAgICAgcGFkWzNdOwo+ICsgICAgICAgdW5pb24gewo+ICsgICAg
ICAgICAgICAgICB1OCBtYWNbNl07Cj4gKyAgICAgICAgICAgICAgIF9fbGUxNiBtYXhfdnFfcGFp
cnM7Cj4gKyAgICAgICB9IF9fcGFja2VkOwo+ICt9Owo+ICsKPiArLyoqCj4gKyAqIHN0cnVjdCBw
ZHNfdmRwYV92cV9pbml0X2NtZCAtIHF1ZXVlIGluaXQgY29tbWFuZAo+ICsgKiBAb3Bjb2RlOiBP
cGNvZGUgUERTX1ZEUEFfQ01EX1ZRX0lOSVQKPiArICogQHZkcGFfaW5kZXg6ICAgICAgICBJbmRl
eCBmb3IgdmRwYSBzdWJkZXZpY2UKPiArICogQHZmX2lkOiAgICAgVkYgaWQKPiArICogQHFpZDog
ICAgICAgUXVldWUgaWQgKGJpdDAgY2xlYXIgPSByeCwgYml0MCBzZXQgPSB0eCwgcWlkPU4gaXMg
Y3RybHEpCj4gKyAqIEBsZW46ICAgICAgIGxvZygyKSBvZiBtYXggZGVzY3JpcHRvciBjb3VudAo+
ICsgKiBAZGVzY19hZGRyOiBETUEgYWRkcmVzcyBvZiBkZXNjcmlwdG9yIGFyZWEKPiArICogQGF2
YWlsX2FkZHI6ICAgICAgICBETUEgYWRkcmVzcyBvZiBhdmFpbGFibGUgZGVzY3JpcHRvcnMgKGFr
YSBkcml2ZXIgYXJlYSkKPiArICogQHVzZWRfYWRkcjogRE1BIGFkZHJlc3Mgb2YgdXNlZCBkZXNj
cmlwdG9ycyAoYWthIGRldmljZSBhcmVhKQo+ICsgKiBAaW50cl9pbmRleDogICAgICAgIGludGVy
cnVwdCBpbmRleAo+ICsgKi8KPiArc3RydWN0IHBkc192ZHBhX3ZxX2luaXRfY21kIHsKPiArICAg
ICAgIHU4ICAgICBvcGNvZGU7Cj4gKyAgICAgICB1OCAgICAgdmRwYV9pbmRleDsKPiArICAgICAg
IF9fbGUxNiB2Zl9pZDsKPiArICAgICAgIF9fbGUxNiBxaWQ7Cj4gKyAgICAgICBfX2xlMTYgbGVu
Owo+ICsgICAgICAgX19sZTY0IGRlc2NfYWRkcjsKPiArICAgICAgIF9fbGU2NCBhdmFpbF9hZGRy
Owo+ICsgICAgICAgX19sZTY0IHVzZWRfYWRkcjsKPiArICAgICAgIF9fbGUxNiBpbnRyX2luZGV4
Owo+ICt9Owo+ICsKPiArLyoqCj4gKyAqIHN0cnVjdCBwZHNfdmRwYV92cV9pbml0X2NvbXAgLSBx
dWV1ZSBpbml0IGNvbXBsZXRpb24KPiArICogQHN0YXR1czogICAgU3RhdHVzIG9mIHRoZSBjb21t
YW5kIChlbnVtIHBkc19jb3JlX3N0YXR1c19jb2RlKQo+ICsgKiBAaHdfcXR5cGU6ICBIVyBxdWV1
ZSB0eXBlLCB1c2VkIGluIGRvb3JiZWxsIHNlbGVjdGlvbgo+ICsgKiBAaHdfcWluZGV4OiBIVyBx
dWV1ZSBpbmRleCwgdXNlZCBpbiBkb29yYmVsbCBzZWxlY3Rpb24KPiArICogQHJzdmQ6ICAgICAg
V29yZCBib3VuZGFyeSBwYWRkaW5nCj4gKyAqIEBjb2xvcjogICAgIENvbG9yIGJpdAo+ICsgKi8K
PiArc3RydWN0IHBkc192ZHBhX3ZxX2luaXRfY29tcCB7Cj4gKyAgICAgICB1OCAgICAgc3RhdHVz
Owo+ICsgICAgICAgdTggICAgIGh3X3F0eXBlOwo+ICsgICAgICAgX19sZTE2IGh3X3FpbmRleDsK
PiArICAgICAgIHU4ICAgICByc3ZkWzExXTsKPiArICAgICAgIHU4ICAgICBjb2xvcjsKPiArfTsK
PiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfdnFfcmVzZXRfY21kIC0gcXVldWUgcmVz
ZXQgY29tbWFuZAo+ICsgKiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1ZRX1JFU0VU
Cj4gKyAqIEB2ZHBhX2luZGV4OiAgICAgICAgSW5kZXggZm9yIHZkcGEgc3ViZGV2aWNlCj4gKyAq
IEB2Zl9pZDogICAgIFZGIGlkCj4gKyAqIEBxaWQ6ICAgICAgIFF1ZXVlIGlkCj4gKyAqLwo+ICtz
dHJ1Y3QgcGRzX3ZkcGFfdnFfcmVzZXRfY21kIHsKPiArICAgICAgIHU4ICAgICBvcGNvZGU7Cj4g
KyAgICAgICB1OCAgICAgdmRwYV9pbmRleDsKPiArICAgICAgIF9fbGUxNiB2Zl9pZDsKPiArICAg
ICAgIF9fbGUxNiBxaWQ7Cj4gK307Cj4gKwo+ICsvKioKPiArICogc3RydWN0IHBkc192ZHBhX3Nl
dF9mZWF0dXJlc19jbWQgLSBzZXQgaHcgZmVhdHVyZXMKPiArICogQG9wY29kZTogT3Bjb2RlIFBE
U19WRFBBX0NNRF9TRVRfRkVBVFVSRVMKPiArICogQHZkcGFfaW5kZXg6ICAgICAgICBJbmRleCBm
b3IgdmRwYSBzdWJkZXZpY2UKPiArICogQHZmX2lkOiAgICAgVkYgaWQKPiArICogQHJzdmQ6ICAg
ICAgIFdvcmQgYm91bmRhcnkgcGFkZGluZwo+ICsgKiBAZmVhdHVyZXM6ICBGZWF0dXJlIGJpdCBt
YXNrCj4gKyAqLwo+ICtzdHJ1Y3QgcGRzX3ZkcGFfc2V0X2ZlYXR1cmVzX2NtZCB7Cj4gKyAgICAg
ICB1OCAgICAgb3Bjb2RlOwo+ICsgICAgICAgdTggICAgIHZkcGFfaW5kZXg7Cj4gKyAgICAgICBf
X2xlMTYgdmZfaWQ7Cj4gKyAgICAgICBfX2xlMzIgcnN2ZDsKPiArICAgICAgIF9fbGU2NCBmZWF0
dXJlczsKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfdnFfc2V0X3N0YXRl
X2NtZCAtIHNldCB2cSBzdGF0ZQo+ICsgKiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01E
X1ZRX1NFVF9TVEFURQo+ICsgKiBAdmRwYV9pbmRleDogICAgICAgIEluZGV4IGZvciB2ZHBhIHN1
YmRldmljZQo+ICsgKiBAdmZfaWQ6ICAgICBWRiBpZAo+ICsgKiBAcWlkOiAgICAgICBRdWV1ZSBp
ZAo+ICsgKiBAYXZhaWw6ICAgICBEZXZpY2UgYXZhaWwgaW5kZXguCj4gKyAqIEB1c2VkOiAgICAg
IERldmljZSB1c2VkIGluZGV4Lgo+ICsgKgo+ICsgKiBJZiB0aGUgdmlydHF1ZXVlIHVzZXMgcGFj
a2VkIGRlc2NyaXB0b3IgZm9ybWF0LCB0aGVuIHRoZSBhdmFpbCBhbmQgdXNlZAo+ICsgKiBpbmRl
eCBtdXN0IGhhdmUgYSB3cmFwIGNvdW50LiAgVGhlIGJpdHMgc2hvdWxkIGJlIGFycmFuZ2VkIGxp
a2UgdGhlIHVwcGVyCj4gKyAqIDE2IGJpdHMgaW4gdGhlIGRldmljZSBhdmFpbGFibGUgbm90aWZp
Y2F0aW9uIGRhdGE6IDE1IGJpdCBpbmRleCwgMSBiaXQgd3JhcC4KPiArICovCj4gK3N0cnVjdCBw
ZHNfdmRwYV92cV9zZXRfc3RhdGVfY21kIHsKPiArICAgICAgIHU4ICAgICBvcGNvZGU7Cj4gKyAg
ICAgICB1OCAgICAgdmRwYV9pbmRleDsKPiArICAgICAgIF9fbGUxNiB2Zl9pZDsKPiArICAgICAg
IF9fbGUxNiBxaWQ7Cj4gKyAgICAgICBfX2xlMTYgYXZhaWw7Cj4gKyAgICAgICBfX2xlMTYgdXNl
ZDsKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfdnFfZ2V0X3N0YXRlX2Nt
ZCAtIGdldCB2cSBzdGF0ZQo+ICsgKiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1ZR
X0dFVF9TVEFURQo+ICsgKiBAdmRwYV9pbmRleDogICAgICAgIEluZGV4IGZvciB2ZHBhIHN1YmRl
dmljZQo+ICsgKiBAdmZfaWQ6ICAgICBWRiBpZAo+ICsgKiBAcWlkOiAgICAgICBRdWV1ZSBpZAo+
ICsgKi8KPiArc3RydWN0IHBkc192ZHBhX3ZxX2dldF9zdGF0ZV9jbWQgewo+ICsgICAgICAgdTgg
ICAgIG9wY29kZTsKPiArICAgICAgIHU4ICAgICB2ZHBhX2luZGV4Owo+ICsgICAgICAgX19sZTE2
IHZmX2lkOwo+ICsgICAgICAgX19sZTE2IHFpZDsKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1
Y3QgcGRzX3ZkcGFfdnFfZ2V0X3N0YXRlX2NvbXAgLSBnZXQgdnEgc3RhdGUgY29tcGxldGlvbgo+
ICsgKiBAc3RhdHVzOiAgICBTdGF0dXMgb2YgdGhlIGNvbW1hbmQgKGVudW0gcGRzX2NvcmVfc3Rh
dHVzX2NvZGUpCj4gKyAqIEByc3ZkMDogICAgICBXb3JkIGJvdW5kYXJ5IHBhZGRpbmcKPiArICog
QGF2YWlsOiAgICAgRGV2aWNlIGF2YWlsIGluZGV4Lgo+ICsgKiBAdXNlZDogICAgICBEZXZpY2Ug
dXNlZCBpbmRleC4KPiArICogQHJzdmQ6ICAgICAgIFdvcmQgYm91bmRhcnkgcGFkZGluZwo+ICsg
KiBAY29sb3I6ICAgICBDb2xvciBiaXQKPiArICoKPiArICogSWYgdGhlIHZpcnRxdWV1ZSB1c2Vz
IHBhY2tlZCBkZXNjcmlwdG9yIGZvcm1hdCwgdGhlbiB0aGUgYXZhaWwgYW5kIHVzZWQKPiArICog
aW5kZXggd2lsbCBoYXZlIGEgd3JhcCBjb3VudC4gIFRoZSBiaXRzIHdpbGwgYmUgYXJyYW5nZWQg
bGlrZSB0aGUgIm5leHQiCj4gKyAqIHBhcnQgb2YgZGV2aWNlIGF2YWlsYWJsZSBub3RpZmljYXRp
b24gZGF0YTogMTUgYml0IGluZGV4LCAxIGJpdCB3cmFwLgo+ICsgKi8KPiArc3RydWN0IHBkc192
ZHBhX3ZxX2dldF9zdGF0ZV9jb21wIHsKPiArICAgICAgIHU4ICAgICBzdGF0dXM7Cj4gKyAgICAg
ICB1OCAgICAgcnN2ZDA7Cj4gKyAgICAgICBfX2xlMTYgYXZhaWw7Cj4gKyAgICAgICBfX2xlMTYg
dXNlZDsKPiArICAgICAgIHU4ICAgICByc3ZkWzldOwo+ICsgICAgICAgdTggICAgIGNvbG9yOwo+
ICt9Owo+ICsKPiAgI2VuZGlmIC8qIF9QRFNfVkRQQV9IXyAqLwo+IC0tCj4gMi4xNy4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
