Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 900203E524F
	for <lists.virtualization@lfdr.de>; Tue, 10 Aug 2021 06:38:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2A783455;
	Tue, 10 Aug 2021 04:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4BZGzx4Pky3; Tue, 10 Aug 2021 04:38:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 319798344C;
	Tue, 10 Aug 2021 04:38:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AECC1C001F;
	Tue, 10 Aug 2021 04:38:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECC87C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 04:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F57607D1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 04:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqJhjq8-xw6m
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 04:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF8E8607B0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 04:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628570325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwKzTmv+LP84T8LRLglFCiZHgJuj0HUx3sp4x4zeslY=;
 b=H3rhzEZQo9cVBhs1RumWAydeYhtspjJdgr5e0dt8SlwwOotnsAFdaAiKDn8NqKLFB5A0cb
 7n9zERZUfP9KloTy61II8zLQsUPHumh4o9K6Az33DBg/qtJCPsXLqtlFePWjCftM4TDA3q
 Xgiw0tjfmxyWwcmoTf70ZECJjpJMjVs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-kga0xmLJPnqw4n6r4ojEow-1; Tue, 10 Aug 2021 00:38:44 -0400
X-MC-Unique: kga0xmLJPnqw4n6r4ojEow-1
Received: by mail-pj1-f72.google.com with SMTP id
 o23-20020a17090a4217b02901774c248202so1267232pjg.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Aug 2021 21:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dwKzTmv+LP84T8LRLglFCiZHgJuj0HUx3sp4x4zeslY=;
 b=YE2g3zZSwlFOWeS501gtfpNu42v+rkyMtx2kGCfIhWB1hcn91gpE6ABkNn6Cq28Ebi
 ndJIERbY2P3dBRPX/KivT0Zb7jDufnyszI9DxnZlwjAYK6uv6FOSbOnbMGyGh2KrhL1D
 Yxm+cPfB2FQPK1pYdAbcoDZe6lCs58Os/ZJu8gIEycbjkyZ9p4YwUApC2K8+4yKjcfXL
 kD0hosuuQ6Su75zMO8mZuefIWevMlCNtp8g31MzHZ6SW8I4vkXA3kzTf8cpB9zPnlkSg
 SSx3f0pRsY/vXv+za48TVjuJ+rJf77/uPwnlf2dT06JwmpxBok1rJC31kwrLVhC4fCt/
 p7gA==
X-Gm-Message-State: AOAM531+mwpqQ3TgLNoWpKvFJvifqNLLeYs/i/VKVvaAkvgIfqFZ6WDg
 xQyX5MXg+vZpVQvTFSwVxuQOS2C6mekZgf2AXoaz1bg+ienbZX3q4akZrHq7PvfuuSqXRe+wyUb
 seBFfzkrV5qO6K3Vfvd07sx266PAI0WeZAQ3Fxw9PQw==
X-Received: by 2002:a17:902:a50f:b029:11a:b033:e158 with SMTP id
 s15-20020a170902a50fb029011ab033e158mr8098296plq.26.1628570322894; 
 Mon, 09 Aug 2021 21:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySQL6vf8xK62xK3VHe+dAeDwwtepb+U55z1rDTBdPM2KqLo0vqbUeyPRpkEy2ffCm3X8EB5w==
X-Received: by 2002:a17:902:a50f:b029:11a:b033:e158 with SMTP id
 s15-20020a170902a50fb029011ab033e158mr8098277plq.26.1628570322643; 
 Mon, 09 Aug 2021 21:38:42 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c14sm25123340pgv.86.2021.08.09.21.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 21:38:42 -0700 (PDT)
Subject: Re: [Patch v1 3/3] vdpa/mlx5: Add multiqueue support
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org
References: <20210809140800.97835-1-elic@nvidia.com>
 <20210809140800.97835-4-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <07002568-e792-aa35-ec42-5e0f12883a03@redhat.com>
Date: Tue, 10 Aug 2021 12:38:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809140800.97835-4-elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: eperezma@redhat.com
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

CuWcqCAyMDIxLzgvOSDkuIvljYgxMDowOCwgRWxpIENvaGVuIOWGmemBkzoKPiBNdWx0aXF1ZXVl
IHN1cHBvcnQgcmVxdWlyZXMgYWRkaXRpb25hbCB2aXJ0aW9fbmV0X3Egb2JqZWN0cyB0byBiZSBh
ZGRlZAo+IG9yIHJlbW92ZWQgcGVyIHRoZSBjb25maWd1cmVkIG51bWJlciBvZiBxdWV1ZSBwYWly
cy4gSW4gYWRkaXRpb24gdGhlIFJRCj4gdGFibGVzIG5lZWRzIHRvIGJlIG1vZGlmaWVkIHRvIG1h
dGNoIHRoZSBudW1iZXIgb2YgY29uZmlndXJlZCByZWNlaXZlCj4gcXVldWVzIHNvIHRoZSBwYWNr
ZXRzIGFyZSBkaXNwYXRjaGVkIHRvIHRoZSByaWdodCB2aXJ0cXVldWUgYWNjb3JkaW5nIHRvCj4g
dGhlIGhhc2ggcmVzdWx0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRWxpIENvaGVuIDxlbGljQG52aWRp
YS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oIHwgICAx
ICsKPiAgIGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3VyY2VzLmMgfCAgMTAgKysKPiAgIGRy
aXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYyAgfCAxNjIgKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92
ZHBhLmggYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oCj4gaW5kZXggNzFiYjI5
ZmNmNGNhLi40MTcxOGRhZDZlNGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL21seDUvY29y
ZS9tbHg1X3ZkcGEuaAo+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgK
PiBAQCAtOTAsNiArOTAsNyBAQCBpbnQgbWx4NV92ZHBhX2dldF9udWxsX21rZXkoc3RydWN0IG1s
eDVfdmRwYV9kZXYgKmRldiwgdTMyICpudWxsX21rZXkpOwo+ICAgaW50IG1seDVfdmRwYV9jcmVh
dGVfdGlzKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdm9pZCAqaW4sIHUzMiAqdGlzbik7
Cj4gICB2b2lkIG1seDVfdmRwYV9kZXN0cm95X3RpcyhzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZk
ZXYsIHUzMiB0aXNuKTsKPiAgIGludCBtbHg1X3ZkcGFfY3JlYXRlX3JxdChzdHJ1Y3QgbWx4NV92
ZHBhX2RldiAqbXZkZXYsIHZvaWQgKmluLCBpbnQgaW5sZW4sIHUzMiAqcnF0bik7Cj4gK2ludCBt
bHg1X3ZkcGFfbW9kaWZ5X3JxdChzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHZvaWQgKmlu
LCBpbnQgaW5sZW4sIHUzMiBycXRuKTsKPiAgIHZvaWQgbWx4NV92ZHBhX2Rlc3Ryb3lfcnF0KHN0
cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdTMyIHJxdG4pOwo+ICAgaW50IG1seDVfdmRwYV9j
cmVhdGVfdGlyKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdm9pZCAqaW4sIHUzMiAqdGly
bik7Cj4gICB2b2lkIG1seDVfdmRwYV9kZXN0cm95X3RpcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAq
bXZkZXYsIHUzMiB0aXJuKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL21seDUvY29yZS9y
ZXNvdXJjZXMuYyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3VyY2VzLmMKPiBpbmRleCBk
MjRhZTFhODUxNTkuLmJiZGNmOWEwMWE2ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvbWx4
NS9jb3JlL3Jlc291cmNlcy5jCj4gKysrIGIvZHJpdmVycy92ZHBhL21seDUvY29yZS9yZXNvdXJj
ZXMuYwo+IEBAIC0xMjksNiArMTI5LDE2IEBAIGludCBtbHg1X3ZkcGFfY3JlYXRlX3JxdChzdHJ1
Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHZvaWQgKmluLCBpbnQgaW5sZW4sIHUzMiAqCj4gICAJ
cmV0dXJuIGVycjsKPiAgIH0KPiAgIAo+ICtpbnQgbWx4NV92ZHBhX21vZGlmeV9ycXQoc3RydWN0
IG1seDVfdmRwYV9kZXYgKm12ZGV2LCB2b2lkICppbiwgaW50IGlubGVuLCB1MzIgcnF0bikKPiAr
ewo+ICsJdTMyIG91dFtNTFg1X1NUX1NaX0RXKGNyZWF0ZV9ycXRfb3V0KV0gPSB7fTsKPiArCj4g
KwlNTFg1X1NFVChtb2RpZnlfcnF0X2luLCBpbiwgdWlkLCBtdmRldi0+cmVzLnVpZCk7Cj4gKwlN
TFg1X1NFVChtb2RpZnlfcnF0X2luLCBpbiwgcnF0biwgcnF0bik7Cj4gKwlNTFg1X1NFVChtb2Rp
ZnlfcnF0X2luLCBpbiwgb3Bjb2RlLCBNTFg1X0NNRF9PUF9NT0RJRllfUlFUKTsKPiArCXJldHVy
biBtbHg1X2NtZF9leGVjKG12ZGV2LT5tZGV2LCBpbiwgaW5sZW4sIG91dCwgc2l6ZW9mKG91dCkp
Owo+ICt9Cj4gKwo+ICAgdm9pZCBtbHg1X3ZkcGFfZGVzdHJveV9ycXQoc3RydWN0IG1seDVfdmRw
YV9kZXYgKm12ZGV2LCB1MzIgcnF0bikKPiAgIHsKPiAgIAl1MzIgaW5bTUxYNV9TVF9TWl9EVyhk
ZXN0cm95X3JxdF9pbildID0ge307Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L25l
dC9tbHg1X3ZuZXQuYyBiL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYwo+IGluZGV4
IDQ2NDQ4YjA3OWFjYS4uMGI1ZWEwMzg2YTQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9t
bHg1L25ldC9tbHg1X3ZuZXQuYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3Zu
ZXQuYwo+IEBAIC0xMzMsNyArMTMzLDcgQEAgc3RydWN0IG1seDVfdmRwYV92aXJ0cXVldWUgewo+
ICAgLyogV2Ugd2lsbCByZW1vdmUgdGhpcyBsaW1pdGF0aW9uIG9uY2UgbWx4NV92ZHBhX2FsbG9j
X3Jlc291cmNlcygpCj4gICAgKiBwcm92aWRlcyBmb3IgZHJpdmVyIHNwYWNlIGFsbG9jYXRpb24K
PiAgICAqLwo+IC0jZGVmaW5lIE1MWDVfTUFYX1NVUFBPUlRFRF9WUVMgMgo+ICsjZGVmaW5lIE1M
WDVfTUFYX1NVUFBPUlRFRF9WUVMgMTYKPiAgIAo+ICAgc3RydWN0IG1seDVfdmRwYV9uZXQgewo+
ICAgCXN0cnVjdCBtbHg1X3ZkcGFfZGV2IG12ZGV2Owo+IEBAIC0xODIsNiArMTgyLDExIEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBtbHg1X3ZkcGFfaXNfbGl0dGxlX2VuZGlhbihzdHJ1Y3QgbWx4NV92
ZHBhX2RldiAqbXZkZXYpCj4gICAJCShtdmRldi0+YWN0dWFsX2ZlYXR1cmVzICYgQklUX1VMTChW
SVJUSU9fRl9WRVJTSU9OXzEpKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdTE2IG1seDV2ZHBhMTZf
dG9fY3B1KHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgX192aXJ0aW8xNiB2YWwpCj4gK3sK
PiArCXJldHVybiBfX3ZpcnRpbzE2X3RvX2NwdShtbHg1X3ZkcGFfaXNfbGl0dGxlX2VuZGlhbiht
dmRldiksIHZhbCk7Cj4gK30KPiArCj4gICBzdGF0aWMgX192aXJ0aW8xNiBjcHVfdG9fbWx4NXZk
cGExNihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHUxNiB2YWwpCj4gICB7Cj4gICAJcmV0
dXJuIF9fY3B1X3RvX3ZpcnRpbzE2KG1seDVfdmRwYV9pc19saXR0bGVfZW5kaWFuKG12ZGV2KSwg
dmFsKTsKPiBAQCAtMTEyNiwxMCArMTEzMSw4IEBAIHN0YXRpYyBpbnQgc2V0dXBfdnEoc3RydWN0
IG1seDVfdmRwYV9uZXQgKm5kZXYsIHN0cnVjdCBtbHg1X3ZkcGFfdmlydHF1ZXVlICptdnEpCj4g
ICAJaWYgKCFtdnEtPm51bV9lbnQpCj4gICAJCXJldHVybiAwOwo+ICAgCj4gLQlpZiAobXZxLT5p
bml0aWFsaXplZCkgewo+IC0JCW1seDVfdmRwYV93YXJuKCZuZGV2LT5tdmRldiwgImF0dGVtcHQg
cmUgaW5pdFxuIik7Cj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQl9Cj4gKwlpZiAobXZxLT5pbml0
aWFsaXplZCkKPiArCQlyZXR1cm4gMDsKCgpMZXQncyB1c2UgYSBzZXBhcmF0ZWQgcGF0Y2ggZm9y
IHRoaXMuCgoKPiAgIAo+ICAgCWVyciA9IGNxX2NyZWF0ZShuZGV2LCBpZHgsIG12cS0+bnVtX2Vu
dCk7Cj4gICAJaWYgKGVycikKPiBAQCAtMTIxNiwxOSArMTIxOSwyMCBAQCBzdGF0aWMgdm9pZCB0
ZWFyZG93bl92cShzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRldiwgc3RydWN0IG1seDVfdmRwYV92
aXJ0cXVldWUgKgo+ICAgCj4gICBzdGF0aWMgaW50IGNyZWF0ZV9ycXQoc3RydWN0IG1seDVfdmRw
YV9uZXQgKm5kZXYpCj4gICB7Cj4gLQlpbnQgbG9nX21heF9ycXQ7Cj4gICAJX19iZTMyICpsaXN0
Owo+ICsJaW50IG1heF9ycXQ7Cj4gICAJdm9pZCAqcnF0YzsKPiAgIAlpbnQgaW5sZW47Cj4gICAJ
dm9pZCAqaW47Cj4gICAJaW50IGksIGo7Cj4gICAJaW50IGVycjsKPiAgIAo+IC0JbG9nX21heF9y
cXQgPSBtaW5fdChpbnQsIDEsIE1MWDVfQ0FQX0dFTihuZGV2LT5tdmRldi5tZGV2LCBsb2dfbWF4
X3JxdF9zaXplKSk7Cj4gLQlpZiAobG9nX21heF9ycXQgPCAxKQo+ICsJbWF4X3JxdCA9IG1pbl90
KGludCwgTUxYNV9NQVhfU1VQUE9SVEVEX1ZRUyAvIDIsCj4gKwkJCTEgPDwgTUxYNV9DQVBfR0VO
KG5kZXYtPm12ZGV2Lm1kZXYsIGxvZ19tYXhfcnF0X3NpemUpKTsKPiArCWlmIChtYXhfcnF0IDwg
MSkKPiAgIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgCj4gLQlpbmxlbiA9IE1MWDVfU1RfU1pf
QllURVMoY3JlYXRlX3JxdF9pbikgKyAoMSA8PCBsb2dfbWF4X3JxdCkgKiBNTFg1X1NUX1NaX0JZ
VEVTKHJxX251bSk7Cj4gKwlpbmxlbiA9IE1MWDVfU1RfU1pfQllURVMoY3JlYXRlX3JxdF9pbikg
KyBtYXhfcnF0ICogTUxYNV9TVF9TWl9CWVRFUyhycV9udW0pOwo+ICAgCWluID0ga3phbGxvYyhp
bmxlbiwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFpbikKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4g
QEAgLTEyMzcsMTAgKzEyNDEsOSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ycXQoc3RydWN0IG1seDVf
dmRwYV9uZXQgKm5kZXYpCj4gICAJcnF0YyA9IE1MWDVfQUREUl9PRihjcmVhdGVfcnF0X2luLCBp
biwgcnF0X2NvbnRleHQpOwo+ICAgCj4gICAJTUxYNV9TRVQocnF0YywgcnF0YywgbGlzdF9xX3R5
cGUsIE1MWDVfUlFUQ19MSVNUX1FfVFlQRV9WSVJUSU9fTkVUX1EpOwo+IC0JTUxYNV9TRVQocnF0
YywgcnF0YywgcnF0X21heF9zaXplLCAxIDw8IGxvZ19tYXhfcnF0KTsKPiAtCU1MWDVfU0VUKHJx
dGMsIHJxdGMsIHJxdF9hY3R1YWxfc2l6ZSwgMSk7Cj4gKwlNTFg1X1NFVChycXRjLCBycXRjLCBy
cXRfbWF4X3NpemUsIG1heF9ycXQpOwo+ICAgCWxpc3QgPSBNTFg1X0FERFJfT0YocnF0YywgcnF0
YywgcnFfbnVtWzBdKTsKPiAtCWZvciAoaSA9IDAsIGogPSAwOyBqIDwgbmRldi0+bXZkZXYubWF4
X3ZxczsgaisrKSB7Cj4gKwlmb3IgKGkgPSAwLCBqID0gMDsgaiA8IG1heF9ycXQ7IGorKykgewo+
ICAgCQlpZiAoIW5kZXYtPnZxc1tqXS5pbml0aWFsaXplZCkKPiAgIAkJCWNvbnRpbnVlOwo+ICAg
Cj4gQEAgLTEyNDksNiArMTI1Miw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3JxdChzdHJ1Y3QgbWx4
NV92ZHBhX25ldCAqbmRldikKPiAgIAkJCWkrKzsKPiAgIAkJfQo+ICAgCX0KPiArCU1MWDVfU0VU
KHJxdGMsIHJxdGMsIHJxdF9hY3R1YWxfc2l6ZSwgaSk7Cj4gICAKPiAgIAllcnIgPSBtbHg1X3Zk
cGFfY3JlYXRlX3JxdCgmbmRldi0+bXZkZXYsIGluLCBpbmxlbiwgJm5kZXYtPnJlcy5ycXRuKTsK
PiAgIAlrZnJlZShpbik7Cj4gQEAgLTEyNTgsNiArMTI2Miw1MiBAQCBzdGF0aWMgaW50IGNyZWF0
ZV9ycXQoc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYpCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4g
ICAKPiArI2RlZmluZSBNTFg1X01PRElGWV9SUVRfTlVNX1JRUyAoKHU2NCkxKQo+ICsKPiAraW50
IG1vZGlmeV9ycXQoc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYsIGludCBudW0pCj4gK3sKPiAr
CV9fYmUzMiAqbGlzdDsKPiArCWludCBtYXhfcnF0Owo+ICsJdm9pZCAqcnF0YzsKPiArCWludCBp
bmxlbjsKPiArCXZvaWQgKmluOwo+ICsJaW50IGksIGo7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCW1h
eF9ycXQgPSBtaW5fdChpbnQsIG5kZXYtPmN1cl9udW1fdnFzIC8gMiwKPiArCQkJMSA8PCBNTFg1
X0NBUF9HRU4obmRldi0+bXZkZXYubWRldiwgbG9nX21heF9ycXRfc2l6ZSkpOwo+ICsJaWYgKG1h
eF9ycXQgPCAxKQo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPiArCj4gKwlpbmxlbiA9IE1MWDVf
U1RfU1pfQllURVMobW9kaWZ5X3JxdF9pbikgKyBtYXhfcnF0ICogTUxYNV9TVF9TWl9CWVRFUyhy
cV9udW0pOwo+ICsJaW4gPSBremFsbG9jKGlubGVuLCBHRlBfS0VSTkVMKTsKPiArCWlmICghaW4p
Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJTUxYNV9TRVQobW9kaWZ5X3JxdF9pbiwgaW4s
IHVpZCwgbmRldi0+bXZkZXYucmVzLnVpZCk7Cj4gKwlNTFg1X1NFVDY0KG1vZGlmeV9ycXRfaW4s
IGluLCBiaXRtYXNrLCBNTFg1X01PRElGWV9SUVRfTlVNX1JRUyk7Cj4gKwlycXRjID0gTUxYNV9B
RERSX09GKG1vZGlmeV9ycXRfaW4sIGluLCBjdHgpOwo+ICsJTUxYNV9TRVQocnF0YywgcnF0Yywg
bGlzdF9xX3R5cGUsIE1MWDVfUlFUQ19MSVNUX1FfVFlQRV9WSVJUSU9fTkVUX1EpOwo+ICsKPiAr
CWxpc3QgPSBNTFg1X0FERFJfT0YocnF0YywgcnF0YywgcnFfbnVtWzBdKTsKPiArCWZvciAoaSA9
IDAsIGogPSAwOyBqIDwgbnVtOyBqKyspIHsKPiArCQlpZiAoIW5kZXYtPnZxc1tqXS5pbml0aWFs
aXplZCkKPiArCQkJY29udGludWU7Cj4gKwo+ICsJCWlmICghdnFfaXNfdHgobmRldi0+dnFzW2pd
LmluZGV4KSkgewo+ICsJCQlsaXN0W2ldID0gY3B1X3RvX2JlMzIobmRldi0+dnFzW2pdLnZpcnRx
X2lkKTsKPiArCQkJaSsrOwo+ICsJCX0KPiArCX0KPiArCU1MWDVfU0VUKHJxdGMsIHJxdGMsIHJx
dF9hY3R1YWxfc2l6ZSwgaSk7Cj4gKwllcnIgPSBtbHg1X3ZkcGFfbW9kaWZ5X3JxdCgmbmRldi0+
bXZkZXYsIGluLCBpbmxlbiwgbmRldi0+cmVzLnJxdG4pOwo+ICsJa2ZyZWUoaW4pOwo+ICsJaWYg
KGVycikKPiArCQlyZXR1cm4gZXJyOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICAgc3Rh
dGljIHZvaWQgZGVzdHJveV9ycXQoc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYpCj4gICB7Cj4g
ICAJbWx4NV92ZHBhX2Rlc3Ryb3lfcnF0KCZuZGV2LT5tdmRldiwgbmRldi0+cmVzLnJxdG4pOwo+
IEBAIC0xNDI0LDYgKzE0NzQsNzcgQEAgdmlydGlvX25ldF9jdHJsX2FjayBoYW5kbGVfY3RybF9t
YWMoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LCB1OCBjbWQpCj4gICAJcmV0dXJuIHN0YXR1
czsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IGNoYW5nZV9udW1fcXBzKHN0cnVjdCBtbHg1X3Zk
cGFfZGV2ICptdmRldiwgaW50IG5ld3FwcykKPiArewo+ICsJc3RydWN0IG1seDVfdmRwYV9uZXQg
Km5kZXYgPSB0b19tbHg1X3ZkcGFfbmRldihtdmRldik7Cj4gKwlpbnQgY3VyX3FwcyA9IG5kZXYt
PmN1cl9udW1fdnFzIC8gMjsKPiArCWludCBlcnI7Cj4gKwlpbnQgaTsKPiArCj4gKwlpZiAoY3Vy
X3FwcyA+IG5ld3Fwcykgewo+ICsJCWVyciA9IG1vZGlmeV9ycXQobmRldiwgMiAqIG5ld3Fwcyk7
Cj4gKwkJaWYgKGVycikKPiArCQkJcmV0dXJuIGVycjsKPiArCj4gKwkJZm9yIChpID0gbmRldi0+
Y3VyX251bV92cXMgLSAxOyBpID49IDIgKiBuZXdxcHM7IGktLSkKPiArCQkJdGVhcmRvd25fdnEo
bmRldiwgJm5kZXYtPnZxc1tpXSk7Cj4gKwo+ICsJCW5kZXYtPmN1cl9udW1fdnFzID0gMiAqIG5l
d3FwczsKPiArCX0gZWxzZSB7Cj4gKwkJbmRldi0+Y3VyX251bV92cXMgPSAyICogbmV3cXBzOwo+
ICsJCWZvciAoaSA9IGN1cl9xcHMgKiAyOyBpIDwgMiAqIG5ld3FwczsgaSsrKSB7Cj4gKwkJCWVy
ciA9IHNldHVwX3ZxKG5kZXYsICZuZGV2LT52cXNbaV0pOwo+ICsJCQlpZiAoZXJyKQo+ICsJCQkJ
Z290byBjbGVhbl9hZGRlZDsKPiArCQl9Cj4gKwkJZXJyID0gbW9kaWZ5X3JxdChuZGV2LCAyICog
bmV3cXBzKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlnb3RvIGNsZWFuX2FkZGVkOwo+ICsJfQo+ICsJ
cmV0dXJuIDA7Cj4gKwo+ICtjbGVhbl9hZGRlZDoKPiArCWZvciAoLS1pOyBpID49IGN1cl9xcHM7
IC0taSkKPiArCQl0ZWFyZG93bl92cShuZGV2LCAmbmRldi0+dnFzW2ldKTsKPiArCj4gKwlyZXR1
cm4gZXJyOwo+ICt9Cj4gKwo+ICt2aXJ0aW9fbmV0X2N0cmxfYWNrIGhhbmRsZV9jdHJsX21xKHN0
cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdTggY21kKQo+ICt7Cj4gKwlzdHJ1Y3QgbWx4NV92
ZHBhX25ldCAqbmRldiA9IHRvX21seDVfdmRwYV9uZGV2KG12ZGV2KTsKPiArCXZpcnRpb19uZXRf
Y3RybF9hY2sgc3RhdHVzID0gVklSVElPX05FVF9FUlI7Cj4gKwlzdHJ1Y3QgbWx4NV9jb250cm9s
X3ZxICpjdnEgPSAmbXZkZXYtPmN2cTsKPiArCXN0cnVjdCB2aXJ0aW9fbmV0X2N0cmxfbXEgbXE7
Cj4gKwlzaXplX3QgcmVhZDsKPiArCXUxNiBuZXdxcHM7Cj4gKwo+ICsJc3dpdGNoIChjbWQpIHsK
PiArCWNhc2UgVklSVElPX05FVF9DVFJMX01RX1ZRX1BBSVJTX1NFVDoKPiArCQlyZWFkID0gdnJp
bmdoX2lvdl9wdWxsX2lvdGxiKCZjdnEtPnZyaW5nLCAmY3ZxLT5yaW92LCAodm9pZCAqKSZtcSwg
c2l6ZW9mKG1xKSk7Cj4gKwkJaWYgKHJlYWQgIT0gc2l6ZW9mKG1xKSkKPiArCQkJYnJlYWs7Cj4g
Kwo+ICsJCW5ld3FwcyA9IG1seDV2ZHBhMTZfdG9fY3B1KG12ZGV2LCBtcS52aXJ0cXVldWVfcGFp
cnMpOwo+ICsJCWlmIChuZGV2LT5jdXJfbnVtX3ZxcyA9PSAyICogbmV3cXBzKSB7Cj4gKwkJCXN0
YXR1cyA9IFZJUlRJT19ORVRfT0s7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCj4gKwkJaWYgKG5l
d3FwcyAmIChuZXdxcHMgLSAxKSkKPiArCQkJYnJlYWs7Cj4gKwo+ICsJCWlmICghY2hhbmdlX251
bV9xcHMobXZkZXYsIG5ld3FwcykpCj4gKwkJCXN0YXR1cyA9IFZJUlRJT19ORVRfT0s7Cj4gKwo+
ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQlicmVhazsKPiArCX0KPiArCj4gKwlyZXR1cm4g
c3RhdHVzOwo+ICt9Cj4gKwo+ICAgc3RhdGljIHZvaWQgbWx4NV9jdnFfa2lja19oYW5kbGVyKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgIHsKPiAgIAl2aXJ0aW9fbmV0X2N0cmxfYWNrIHN0
YXR1cyA9IFZJUlRJT19ORVRfRVJSOwo+IEBAIC0xNDU5LDYgKzE1ODAsOSBAQCBzdGF0aWMgdm9p
ZCBtbHg1X2N2cV9raWNrX2hhbmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAgCQlj
YXNlIFZJUlRJT19ORVRfQ1RSTF9NQUM6Cj4gICAJCQlzdGF0dXMgPSBoYW5kbGVfY3RybF9tYWMo
bXZkZXYsIGN0cmwuY21kKTsKPiAgIAkJCWJyZWFrOwo+ICsJCWNhc2UgVklSVElPX05FVF9DVFJM
X01ROgo+ICsJCQlzdGF0dXMgPSBoYW5kbGVfY3RybF9tcShtdmRldiwgY3RybC5jbWQpOwo+ICsJ
CQlicmVhazsKPiAgIAo+ICAgCQlkZWZhdWx0Ogo+ICAgCQkJYnJlYWs7Cj4gQEAgLTE3MDgsNiAr
MTgzMiw3IEBAIHN0YXRpYyB1NjQgbWx4NV92ZHBhX2dldF9mZWF0dXJlcyhzdHJ1Y3QgdmRwYV9k
ZXZpY2UgKnZkZXYpCj4gICAJbmRldi0+bXZkZXYubWx4X2ZlYXR1cmVzIHw9IEJJVF9VTEwoVklS
VElPX0ZfQUNDRVNTX1BMQVRGT1JNKTsKPiAgIAluZGV2LT5tdmRldi5tbHhfZmVhdHVyZXMgfD0g
QklUX1VMTChWSVJUSU9fTkVUX0ZfQ1RSTF9WUSk7Cj4gICAJbmRldi0+bXZkZXYubWx4X2ZlYXR1
cmVzIHw9IEJJVF9VTEwoVklSVElPX05FVF9GX0NUUkxfTUFDX0FERFIpOwo+ICsJbmRldi0+bXZk
ZXYubWx4X2ZlYXR1cmVzIHw9IEJJVF9VTEwoVklSVElPX05FVF9GX01RKTsKPiAgIAo+ICAgCXBy
aW50X2ZlYXR1cmVzKG12ZGV2LCBuZGV2LT5tdmRldi5tbHhfZmVhdHVyZXMsIGZhbHNlKTsKPiAg
IAlyZXR1cm4gbmRldi0+bXZkZXYubWx4X2ZlYXR1cmVzOwo+IEBAIC0xODE5LDE1ICsxOTQ0LDE0
IEBAIHN0YXRpYyB1OCBtbHg1X3ZkcGFfZ2V0X3N0YXR1cyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZk
ZXYpCj4gICBzdGF0aWMgaW50IHNhdmVfY2hhbm5lbF9pbmZvKHN0cnVjdCBtbHg1X3ZkcGFfbmV0
ICpuZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX3ZpcnRxdWV1ZSAqbXZxKQo+ICAgewo+ICAgCXN0cnVj
dCBtbHg1X3ZxX3Jlc3RvcmVfaW5mbyAqcmkgPSAmbXZxLT5yaTsKPiAtCXN0cnVjdCBtbHg1X3Zp
cnRxX2F0dHIgYXR0cjsKPiArCXN0cnVjdCBtbHg1X3ZpcnRxX2F0dHIgYXR0ciA9IHt9Owo+ICAg
CWludCBlcnI7Cj4gICAKPiAtCWlmICghbXZxLT5pbml0aWFsaXplZCkKPiAtCQlyZXR1cm4gMDsK
PiAtCj4gLQllcnIgPSBxdWVyeV92aXJ0cXVldWUobmRldiwgbXZxLCAmYXR0cik7Cj4gLQlpZiAo
ZXJyKQo+IC0JCXJldHVybiBlcnI7Cj4gKwlpZiAobXZxLT5pbml0aWFsaXplZCkgewo+IAkKPiAr
CQlpZiAoZXJyKQo+ICsJCQlyZXR1cm4gZXJyOwo+ICsJfQoKCk9uZSB0aGluZyBuZWVkIHRvIHNv
bHZlIGZvciBtcSBpcyB0aGF0IHRoZToKCgo+ICtzdGF0aWMgdTE2IGN0cmxfdnFfaWR4KHN0cnVj
dCAgbWx4NV92ZHBhX2RldiAqbXZkZXYpCj4gK3sKPiArwqAgwqAgwqByZXR1cm4gMiAqICBtbHg1
X3ZkcGFfbWF4X3FwcyhtdmRldi0+bWF4X3Zxcyk7Cj4gK30KCldlIHNob3VsZCBoYW5kbGUgdGhl
IGNhc2Ugd2hlbiBNUSBpcyBzdXBwb3J0ZWQgYnkgdGhlIGRldmljZSBidXQgbm90IHRoZSAKZHJp
dmVyLgoKRS5nIGluIHRoZSBjYXNlIHdoZW4gd2UgaGF2ZSAyIHF1ZXVlIHBhaXJzOgoKV2hlbiBN
USBpcyBlbmFibGVkLCBjdnEgaXMgcXVldWUgNAoKV2hlbiBNUSBpcyBub3QgZW5hYmxlZCwgY3Zx
IGlzIHF1ZXVlIDIKClRoYW5rcwoKCj4gICAKPiAgIAlyaS0+YXZhaWxfaW5kZXggPSBhdHRyLmF2
YWlsYWJsZV9pbmRleDsKPiAgIAlyaS0+dXNlZF9pbmRleCA9IGF0dHIudXNlZF9pbmRleDsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
