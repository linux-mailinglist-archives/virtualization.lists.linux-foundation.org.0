Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 688FD5110B7
	for <lists.virtualization@lfdr.de>; Wed, 27 Apr 2022 07:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A93F418D5;
	Wed, 27 Apr 2022 05:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgm_NnUvFsDc; Wed, 27 Apr 2022 05:56:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 391A0418C3;
	Wed, 27 Apr 2022 05:56:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 790D6C0081;
	Wed, 27 Apr 2022 05:56:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D748DC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Apr 2022 05:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5DCC82F4F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Apr 2022 05:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPli_ap7ctYL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Apr 2022 05:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6558A82DD9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Apr 2022 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651039003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qeULQ41fQcQFOy0CY9Heuj/JvDE2+huvj1l00MURAI=;
 b=RCRhi63AqEx1FsWFWu06iq9gX20Eh9JvlqOJijWV/OcSQVQtIN4sQgLGG4eM4vQyLkTyMW
 YNX4eV33qAdWG/ey7NsoeCXwh0QMrwyWfXsB/jLYkdZbU7l7JbVs9f36jepgMWW0mi7eik
 tudeq28HUFqVo3k+jUA3eu2m77EkI+w=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-VSZIo8Y3PzCEL3ooJSR2SA-1; Wed, 27 Apr 2022 01:56:42 -0400
X-MC-Unique: VSZIo8Y3PzCEL3ooJSR2SA-1
Received: by mail-pl1-f200.google.com with SMTP id
 bj12-20020a170902850c00b0015adf30aaccso504910plb.15
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Apr 2022 22:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9qeULQ41fQcQFOy0CY9Heuj/JvDE2+huvj1l00MURAI=;
 b=CfLiHjh7fzTfIgmBIOVa29t0LE0IdH4lQx/09RjOR1b/630s75ky3xDmQmX/pQ5T4i
 LpR7KqGBpzQV1pslduLu9Y3Kkg5idn0C8r2fX1AS25mMs1fTEXGJwfPMSo8BvnpbVDHJ
 n/vhbFfS286Bmze5d+OJfMITRJ4Z1YYLxz4swom3ATYzzYxRmB0rD3LaZBfs4sNDQ7s2
 HqEcPRjkhoZ6o1txj+nfIKEYM3yHxxq4dahUteU4V1ADldHFQ1iQ54yjnr7inlwS/UfG
 dGq/Kdjg8YKNm1QpSjSuTWqavKdfprtK9HlWt/uvyI9rjJ8ZueZsjjuKgov+rXdalzb2
 nTsw==
X-Gm-Message-State: AOAM530dxXRD+QoEuB6/GIu7Vi5nTnyRVBK+FF0VJ3s8QquViPaHfEPJ
 uG/JrQy2puAKiAXTFjjn/DTeiLD9Fi+agKDcBY1M9Rn1qJwg6KHf7EpxL1/jsOdOE3iorif5sy+
 pvAwpCS//vDB9g3hroy+2GH11LFJ+UnZIhLoImiZkJg==
X-Received: by 2002:a62:b60f:0:b0:508:2a61:2c8b with SMTP id
 j15-20020a62b60f000000b005082a612c8bmr28370677pff.2.1651039001298; 
 Tue, 26 Apr 2022 22:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiiea0IwzZ22wAsh+sUDv5wKE8S6Fn4TlE5ivWn54gAuceV6BckQLQRjvue0imRQT6365j+g==
X-Received: by 2002:a62:b60f:0:b0:508:2a61:2c8b with SMTP id
 j15-20020a62b60f000000b005082a612c8bmr28370650pff.2.1651039000929; 
 Tue, 26 Apr 2022 22:56:40 -0700 (PDT)
Received: from [10.72.12.60] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 16-20020a621410000000b0050aca5f79f5sm17592732pfu.97.2022.04.26.22.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 22:56:40 -0700 (PDT)
Message-ID: <d36fbb4e-c848-3a06-6a81-8cd1b219a6d4@redhat.com>
Date: Wed, 27 Apr 2022 13:56:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH V2] vDPA/ifcvf: allow userspace to suspend a queue
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com
References: <20220424113321.7176-1-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220424113321.7176-1-lingshan.zhu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
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

CuWcqCAyMDIyLzQvMjQgMTk6MzMsIFpodSBMaW5nc2hhbiDlhpnpgZM6Cj4gRm9ybWVybHksIGlm
Y3ZmIGRyaXZlciBoYXMgaW1wbGVtZW50ZWQgYSBsYXp5LWluaXRpYWxpemF0aW9uIG1lY2hhbmlz
bQo+IGZvciB0aGUgdmlydHF1ZXVlcywgaXQgd291bGQgc3RvcmUgYWxsIHZpcnRxdWV1ZSBjb25m
aWcgZmllbGRzIHRoYXQKPiBwYXNzZWQgZG93biBmcm9tIHRoZSB1c2Vyc3BhY2UsIHRoZW4gbG9h
ZCB0aGVtIHRvIHRoZSB2aXJ0cXVldWVzIGFuZAo+IGVuYWJsZSB0aGUgcXVldWVzIHVwb24gRFJJ
VkVSX09LLgo+Cj4gVG8gYWxsb3cgdGhlIHVzZXJzcGFjZSB0byBzdXNwZW5kIGEgdmlydHF1ZXVl
LAo+IHRoaXMgY29tbWl0IHBhc3NlcyBxdWV1ZV9lbmFibGUgdG8gdGhlIHZpcnRxdWV1ZSBkaXJl
Y3RseSB0aHJvdWdoCj4gc2V0X3ZxX3JlYWR5KCkuCj4KPiBUaGlzIGZlYXR1cmUgcmVxdWlyZXMg
YW5kIHRoaXMgY29tbWl0cyBpbXBsZW1lbnRpbmcgYWxsIHZpcnRxdWV1ZQo+IG9wcyhzZXRfdnFf
YWRkciwgc2V0X3ZxX251bSBhbmQgc2V0X3ZxX3JlYWR5KSB0byB0YWtlIGltbWVkaWF0ZQo+IGFj
dGlvbnMgdGhhbiBsYXp5LWluaXRpYWxpemF0aW9uLCBzbyBpZmN2Zl9od19lbmFibGUoKSBpcyBy
ZXRpcmVkLgo+Cj4gc2V0X2ZlYXR1cmVzKCkgc2hvdWxkIHRha2UgaW1tZWRpYXRlIGFjdGlvbnMg
YXMgd2VsbC4KPgo+IGlmY3ZmX2FkZF9zdGF0dXMoKSBpcyByZXRpZXJkIGJlY2F1c2Ugd2Ugc2hv
dWxkIG5vdCBhZGQKPiBzdGF0dXMgbGlrZSBGRUFUVVJFU19PSyBieSBpZmN2ZidzIGRlY2lzaW9u
LCB0aGlzIGRyaXZlciBzaG91bGQKPiBvbmx5IHNldCBkZXZpY2Ugc3RhdHVzIHVwb24gdmRwYV9v
cHMuc2V0X3N0YXR1cygpCj4KPiBUbyBhdm9pZCBsb3NpbmcgdmlydHF1ZXVlIGNvbmZpZ3VyYXRp
b25zIGNhdXNlZCBieSBtdWx0aXBsZQo+IHJvdW5kcyBvZiByZXNldCgpLCB0aGlzIGNvbW1pdCBh
bHNvIHJlZmFjdG9ycyB0aGVkIGV2aWNlIHJlc2V0Cj4gcm91dGluZSwgbm93IGl0IHNpbXBseSBy
ZXNldCB0aGUgY29uZmlnIGhhbmRsZXIgYW5kIHRoZSB2aXJ0cXVldWVzLAo+IGFuZCBvbmx5IG9u
Y2UgZGV2aWNlLXJlc2V0KCkuCgoKSXQgbG9va3MgbGlrZSB0aGUgcGF0Y2ggdHJpZXMgdG8gZG8g
dG9vIG1hbnkgdGhpbmdzIGF0IG9uZSBydW4uIEknZCAKc3VnZ2VzdCB0byBzcGxpdCB0aGVtOgoK
CjEpIG9uLXRoZS1mbHkgc2V0IHZpYSBzZXRfdnFfcmVhZHkoKSwgYnV0IEkgZG9uJ3Qgc2VlIGEg
cmVhc29uIHdoeSB3ZSAKbmVlZCB0byBjaGFuZ2Ugb3RoZXIgbGF6eSBzdHVmZnMsIHNpbmNlIHNl
dHRpbmcgcXVldWVfZW5hYmxlIHRvIDEgYmVmb3JlIApEUklWRVJfT0sgd29uJ3Qgc3RhcnQgdGhl
IHZpcnRxdWV1ZSBhbnlob3cKMikgaWYgbmVjZXNzYXJ5LCBjb252ZXJ0aW5nIHRoZSBsYXp5IHN0
dWZmcwozKSB0aGUgc3luY2hvcm5pemVfaXJxKCkgZml4ZXMKNCkgb3RoZXIgc3R1ZmZzCgpUaGFu
a3MKCgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYyB8IDE1MCArKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3Zm
X2Jhc2UuaCB8ICAxNiArKy0tCj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwg
IDgxICsrKy0tLS0tLS0tLS0tLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDExMSBpbnNlcnRpb25z
KCspLCAxMzYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3Zm
L2lmY3ZmX2Jhc2UuYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMKPiBpbmRleCA0
OGM0ZGFkYjBjN2MuLmJiYzkwMDdhNmYzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZj
dmYvaWZjdmZfYmFzZS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYwo+
IEBAIC0xNzksMjAgKzE3OSw3IEBAIHZvaWQgaWZjdmZfc2V0X3N0YXR1cyhzdHJ1Y3QgaWZjdmZf
aHcgKmh3LCB1OCBzdGF0dXMpCj4gICAKPiAgIHZvaWQgaWZjdmZfcmVzZXQoc3RydWN0IGlmY3Zm
X2h3ICpodykKPiAgIHsKPiAtCWh3LT5jb25maWdfY2IuY2FsbGJhY2sgPSBOVUxMOwo+IC0JaHct
PmNvbmZpZ19jYi5wcml2YXRlID0gTlVMTDsKPiAtCj4gICAJaWZjdmZfc2V0X3N0YXR1cyhodywg
MCk7Cj4gLQkvKiBmbHVzaCBzZXRfc3RhdHVzLCBtYWtlIHN1cmUgVkYgaXMgc3RvcHBlZCwgcmVz
ZXQgKi8KPiAtCWlmY3ZmX2dldF9zdGF0dXMoaHcpOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBp
ZmN2Zl9hZGRfc3RhdHVzKHN0cnVjdCBpZmN2Zl9odyAqaHcsIHU4IHN0YXR1cykKPiAtewo+IC0J
aWYgKHN0YXR1cyAhPSAwKQo+IC0JCXN0YXR1cyB8PSBpZmN2Zl9nZXRfc3RhdHVzKGh3KTsKPiAt
Cj4gLQlpZmN2Zl9zZXRfc3RhdHVzKGh3LCBzdGF0dXMpOwo+ICAgCWlmY3ZmX2dldF9zdGF0dXMo
aHcpOwo+ICAgfQo+ICAgCj4gQEAgLTIxMyw3ICsyMDAsNyBAQCB1NjQgaWZjdmZfZ2V0X2h3X2Zl
YXR1cmVzKHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4gICAJcmV0dXJuIGZlYXR1cmVzOwo+ICAgfQo+
ICAgCj4gLXU2NCBpZmN2Zl9nZXRfZmVhdHVyZXMoc3RydWN0IGlmY3ZmX2h3ICpodykKPiArdTY0
IGlmY3ZmX2dldF9kZXZpY2VfZmVhdHVyZXMoc3RydWN0IGlmY3ZmX2h3ICpodykKPiAgIHsKPiAg
IAlyZXR1cm4gaHctPmh3X2ZlYXR1cmVzOwo+ICAgfQo+IEBAIC0yODAsNyArMjY3LDcgQEAgdm9p
ZCBpZmN2Zl93cml0ZV9kZXZfY29uZmlnKHN0cnVjdCBpZmN2Zl9odyAqaHcsIHU2NCBvZmZzZXQs
Cj4gICAJCXZwX2lvd3JpdGU4KCpwKyssIGh3LT5kZXZfY2ZnICsgb2Zmc2V0ICsgaSk7Cj4gICB9
Cj4gICAKPiAtc3RhdGljIHZvaWQgaWZjdmZfc2V0X2ZlYXR1cmVzKHN0cnVjdCBpZmN2Zl9odyAq
aHcsIHU2NCBmZWF0dXJlcykKPiArdm9pZCBpZmN2Zl9zZXRfZmVhdHVyZXMoc3RydWN0IGlmY3Zm
X2h3ICpodywgdTY0IGZlYXR1cmVzKQo+ICAgewo+ICAgCXN0cnVjdCB2aXJ0aW9fcGNpX2NvbW1v
bl9jZmcgX19pb21lbSAqY2ZnID0gaHctPmNvbW1vbl9jZmc7Cj4gICAKPiBAQCAtMjg5LDIyICsy
NzYsMjIgQEAgc3RhdGljIHZvaWQgaWZjdmZfc2V0X2ZlYXR1cmVzKHN0cnVjdCBpZmN2Zl9odyAq
aHcsIHU2NCBmZWF0dXJlcykKPiAgIAo+ICAgCXZwX2lvd3JpdGUzMigxLCAmY2ZnLT5ndWVzdF9m
ZWF0dXJlX3NlbGVjdCk7Cj4gICAJdnBfaW93cml0ZTMyKGZlYXR1cmVzID4+IDMyLCAmY2ZnLT5n
dWVzdF9mZWF0dXJlKTsKPiArCj4gKwl2cF9pb3JlYWQzMigmY2ZnLT5ndWVzdF9mZWF0dXJlKTsK
PiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGlmY3ZmX2NvbmZpZ19mZWF0dXJlcyhzdHJ1Y3QgaWZj
dmZfaHcgKmh3KQo+ICt1NjQgaWZjdmZfZ2V0X2ZlYXR1cmVzKHN0cnVjdCBpZmN2Zl9odyAqaHcp
Cj4gICB7Cj4gLQlzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqaWZjdmY7Cj4gKwlzdHJ1Y3QgdmlydGlv
X3BjaV9jb21tb25fY2ZnIF9faW9tZW0gKmNmZyA9IGh3LT5jb21tb25fY2ZnOwo+ICsJdTY0IGZl
YXR1cmVzOwo+ICAgCj4gLQlpZmN2ZiA9IHZmX3RvX2FkYXB0ZXIoaHcpOwo+IC0JaWZjdmZfc2V0
X2ZlYXR1cmVzKGh3LCBody0+cmVxX2ZlYXR1cmVzKTsKPiAtCWlmY3ZmX2FkZF9zdGF0dXMoaHcs
IFZJUlRJT19DT05GSUdfU19GRUFUVVJFU19PSyk7Cj4gKwl2cF9pb3dyaXRlMzIoMCwgJmNmZy0+
ZGV2aWNlX2ZlYXR1cmVfc2VsZWN0KTsKPiArCWZlYXR1cmVzID0gdnBfaW9yZWFkMzIoJmNmZy0+
ZGV2aWNlX2ZlYXR1cmUpOwo+ICAgCj4gLQlpZiAoIShpZmN2Zl9nZXRfc3RhdHVzKGh3KSAmIFZJ
UlRJT19DT05GSUdfU19GRUFUVVJFU19PSykpIHsKPiAtCQlJRkNWRl9FUlIoaWZjdmYtPnBkZXYs
ICJGYWlsZWQgdG8gc2V0IEZFQVRVUkVTX09LIHN0YXR1c1xuIik7Cj4gLQkJcmV0dXJuIC1FSU87
Cj4gLQl9Cj4gKwl2cF9pb3dyaXRlMzIoMSwgJmNmZy0+ZGV2aWNlX2ZlYXR1cmVfc2VsZWN0KTsK
PiArCWZlYXR1cmVzIHw9ICgodTY0KXZwX2lvcmVhZDMyKCZjZmctPmd1ZXN0X2ZlYXR1cmUpIDw8
IDMyKTsKPiAgIAo+IC0JcmV0dXJuIDA7Cj4gKwlyZXR1cm4gZmVhdHVyZXM7Cj4gICB9Cj4gICAK
PiAgIHUxNiBpZmN2Zl9nZXRfdnFfc3RhdGUoc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2IHFpZCkK
PiBAQCAtMzMxLDY4ICszMTgsMTExIEBAIGludCBpZmN2Zl9zZXRfdnFfc3RhdGUoc3RydWN0IGlm
Y3ZmX2h3ICpodywgdTE2IHFpZCwgdTE2IG51bSkKPiAgIAlpZmN2Zl9sbSA9IChzdHJ1Y3QgaWZj
dmZfbG1fY2ZnIF9faW9tZW0gKilody0+bG1fY2ZnOwo+ICAgCXFfcGFpcl9pZCA9IHFpZCAvIGh3
LT5ucl92cmluZzsKPiAgIAlhdmFpbF9pZHhfYWRkciA9ICZpZmN2Zl9sbS0+dnJpbmdfbG1fY2Zn
W3FfcGFpcl9pZF0uaWR4X2FkZHJbcWlkICUgMl07Cj4gLQlody0+dnJpbmdbcWlkXS5sYXN0X2F2
YWlsX2lkeCA9IG51bTsKPiAgIAl2cF9pb3dyaXRlMTYobnVtLCBhdmFpbF9pZHhfYWRkcik7Cj4g
ICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGlmY3ZmX2h3X2VuYWJs
ZShzdHJ1Y3QgaWZjdmZfaHcgKmh3KQo+ICt2b2lkIGlmY3ZmX3NldF92cV9udW0oc3RydWN0IGlm
Y3ZmX2h3ICpodywgdTE2IHFpZCwgdTMyIG51bSkKPiAgIHsKPiAtCXN0cnVjdCB2aXJ0aW9fcGNp
X2NvbW1vbl9jZmcgX19pb21lbSAqY2ZnOwo+IC0JdTMyIGk7Cj4gKwlzdHJ1Y3QgdmlydGlvX3Bj
aV9jb21tb25fY2ZnIF9faW9tZW0gKmNmZyA9IGh3LT5jb21tb25fY2ZnOwo+ICAgCj4gLQljZmcg
PSBody0+Y29tbW9uX2NmZzsKPiAtCWZvciAoaSA9IDA7IGkgPCBody0+bnJfdnJpbmc7IGkrKykg
ewo+IC0JCWlmICghaHctPnZyaW5nW2ldLnJlYWR5KQo+IC0JCQlicmVhazsKPiArCXZwX2lvd3Jp
dGUxNihxaWQsICZjZmctPnF1ZXVlX3NlbGVjdCk7Cj4gKwl2cF9pb3dyaXRlMTYobnVtLCAmY2Zn
LT5xdWV1ZV9zaXplKTsKPiArfQo+ICAgCj4gLQkJdnBfaW93cml0ZTE2KGksICZjZmctPnF1ZXVl
X3NlbGVjdCk7Cj4gLQkJdnBfaW93cml0ZTY0X3R3b3BhcnQoaHctPnZyaW5nW2ldLmRlc2MsICZj
ZmctPnF1ZXVlX2Rlc2NfbG8sCj4gLQkJCQkgICAgICZjZmctPnF1ZXVlX2Rlc2NfaGkpOwo+IC0J
CXZwX2lvd3JpdGU2NF90d29wYXJ0KGh3LT52cmluZ1tpXS5hdmFpbCwgJmNmZy0+cXVldWVfYXZh
aWxfbG8sCj4gLQkJCQkgICAgICAmY2ZnLT5xdWV1ZV9hdmFpbF9oaSk7Cj4gLQkJdnBfaW93cml0
ZTY0X3R3b3BhcnQoaHctPnZyaW5nW2ldLnVzZWQsICZjZmctPnF1ZXVlX3VzZWRfbG8sCj4gLQkJ
CQkgICAgICZjZmctPnF1ZXVlX3VzZWRfaGkpOwo+IC0JCXZwX2lvd3JpdGUxNihody0+dnJpbmdb
aV0uc2l6ZSwgJmNmZy0+cXVldWVfc2l6ZSk7Cj4gLQkJaWZjdmZfc2V0X3ZxX3N0YXRlKGh3LCBp
LCBody0+dnJpbmdbaV0ubGFzdF9hdmFpbF9pZHgpOwo+IC0JCXZwX2lvd3JpdGUxNigxLCAmY2Zn
LT5xdWV1ZV9lbmFibGUpOwo+IC0JfQo+ICtpbnQgaWZjdmZfc2V0X3ZxX2FkZHJlc3Moc3RydWN0
IGlmY3ZmX2h3ICpodywgdTE2IHFpZCwgdTY0IGRlc2NfYXJlYSwKPiArCQkJIHU2NCBkcml2ZXJf
YXJlYSwgdTY0IGRldmljZV9hcmVhKQo+ICt7Cj4gKwlzdHJ1Y3QgdmlydGlvX3BjaV9jb21tb25f
Y2ZnIF9faW9tZW0gKmNmZyA9IGh3LT5jb21tb25fY2ZnOwo+ICsKPiArCXZwX2lvd3JpdGUxNihx
aWQsICZjZmctPnF1ZXVlX3NlbGVjdCk7Cj4gKwl2cF9pb3dyaXRlNjRfdHdvcGFydChkZXNjX2Fy
ZWEsICZjZmctPnF1ZXVlX2Rlc2NfbG8sCj4gKwkJCSAgICAgJmNmZy0+cXVldWVfZGVzY19oaSk7
Cj4gKwl2cF9pb3dyaXRlNjRfdHdvcGFydChkcml2ZXJfYXJlYSwgJmNmZy0+cXVldWVfYXZhaWxf
bG8sCj4gKwkJCSAgICAgJmNmZy0+cXVldWVfYXZhaWxfaGkpOwo+ICsJdnBfaW93cml0ZTY0X3R3
b3BhcnQoZGV2aWNlX2FyZWEsICZjZmctPnF1ZXVlX3VzZWRfbG8sCj4gKwkJCSAgICAgJmNmZy0+
cXVldWVfdXNlZF9oaSk7Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMg
dm9pZCBpZmN2Zl9od19kaXNhYmxlKHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4gK3ZvaWQgaWZjdmZf
c2V0X3ZxX3JlYWR5KHN0cnVjdCBpZmN2Zl9odyAqaHcsIHUxNiBxaWQsIGJvb2wgcmVhZHkpCj4g
ICB7Cj4gLQl1MzIgaTsKPiArCXN0cnVjdCB2aXJ0aW9fcGNpX2NvbW1vbl9jZmcgX19pb21lbSAq
Y2ZnID0gaHctPmNvbW1vbl9jZmc7Cj4gKwo+ICsJdnBfaW93cml0ZTE2KHFpZCwgJmNmZy0+cXVl
dWVfc2VsZWN0KTsKPiArCS8qIHdyaXRlIDAgdG8gcXVldWVfZW5hYmxlIHdpbGwgc3VzcGVuZCBh
IHF1ZXVlKi8KPiArCXZwX2lvd3JpdGUxNihyZWFkeSwgJmNmZy0+cXVldWVfZW5hYmxlKTsKPiAr
fQo+ICsKPiArYm9vbCBpZmN2Zl9nZXRfdnFfcmVhZHkoc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2
IHFpZCkKPiArewo+ICsJc3RydWN0IHZpcnRpb19wY2lfY29tbW9uX2NmZyBfX2lvbWVtICpjZmcg
PSBody0+Y29tbW9uX2NmZzsKPiArCWJvb2wgcXVldWVfZW5hYmxlOwo+ICsKPiArCXZwX2lvd3Jp
dGUxNihxaWQsICZjZmctPnF1ZXVlX3NlbGVjdCk7Cj4gKwlxdWV1ZV9lbmFibGUgPSB2cF9pb3Jl
YWQxNigmY2ZnLT5xdWV1ZV9lbmFibGUpOwo+ICsKPiArCXJldHVybiAoYm9vbClxdWV1ZV9lbmFi
bGU7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHN5bmNocm9uaXplX3Blcl92cV9pcnEoc3RydWN0
IGlmY3ZmX2h3ICpodykKPiArewo+ICsJaW50IGk7Cj4gICAKPiAtCWlmY3ZmX3NldF9jb25maWdf
dmVjdG9yKGh3LCBWSVJUSU9fTVNJX05PX1ZFQ1RPUik7Cj4gICAJZm9yIChpID0gMDsgaSA8IGh3
LT5ucl92cmluZzsgaSsrKSB7Cj4gLQkJaWZjdmZfc2V0X3ZxX3ZlY3RvcihodywgaSwgVklSVElP
X01TSV9OT19WRUNUT1IpOwo+ICsJCWlmIChody0+dnJpbmdbaV0uaXJxICE9IC1FSU5WQUwpCj4g
KwkJCXN5bmNocm9uaXplX2lycShody0+dnJpbmdbaV0uaXJxKTsKPiAgIAl9Cj4gICB9Cj4gICAK
PiAtaW50IGlmY3ZmX3N0YXJ0X2h3KHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4gK3N0YXRpYyB2b2lk
IHN5bmNocm9uaXplX3Zxc19yZXVzZWRfaXJxKHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4gICB7Cj4g
LQlpZmN2Zl9yZXNldChodyk7Cj4gLQlpZmN2Zl9hZGRfc3RhdHVzKGh3LCBWSVJUSU9fQ09ORklH
X1NfQUNLTk9XTEVER0UpOwo+IC0JaWZjdmZfYWRkX3N0YXR1cyhodywgVklSVElPX0NPTkZJR19T
X0RSSVZFUik7Cj4gKwlpZiAoaHctPnZxc19yZXVzZWRfaXJxICE9IC1FSU5WQUwpCj4gKwkJc3lu
Y2hyb25pemVfaXJxKGh3LT52cXNfcmV1c2VkX2lycSk7Cj4gK30KPiAgIAo+IC0JaWYgKGlmY3Zm
X2NvbmZpZ19mZWF0dXJlcyhodykgPCAwKQo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICtzdGF0aWMg
dm9pZCBzeW5jaHJvbml6ZV92cV9pcnEoc3RydWN0IGlmY3ZmX2h3ICpodykKPiArewo+ICsJdTgg
c3RhdHVzID0gaHctPm1zaXhfdmVjdG9yX3N0YXR1czsKPiAgIAo+IC0JaWYgKGlmY3ZmX2h3X2Vu
YWJsZShodykgPCAwKQo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJaWYgKHN0YXR1cyA9PSBNU0lY
X1ZFQ1RPUl9QRVJfVlFfQU5EX0NPTkZJRykKPiArCQlzeW5jaHJvbml6ZV9wZXJfdnFfaXJxKGh3
KTsKPiArCWVsc2UKPiArCQlzeW5jaHJvbml6ZV92cXNfcmV1c2VkX2lycShodyk7Cj4gK30KPiAg
IAo+IC0JaWZjdmZfYWRkX3N0YXR1cyhodywgVklSVElPX0NPTkZJR19TX0RSSVZFUl9PSyk7Cj4g
K3N0YXRpYyB2b2lkIHN5bmNocm9uaXplX2NvbmZpZ19pcnEoc3RydWN0IGlmY3ZmX2h3ICpodykK
PiArewo+ICsJaWYgKGh3LT5jb25maWdfaXJxICE9IC1FSU5WQUwpCj4gKwkJc3luY2hyb25pemVf
aXJxKGh3LT5jb25maWdfaXJxKTsKPiArfQo+ICAgCj4gLQlyZXR1cm4gMDsKPiArc3RhdGljIHZv
aWQgaWZjdmZfcmVzZXRfdnJpbmcoc3RydWN0IGlmY3ZmX2h3ICpodykKPiArewo+ICsJaW50IGk7
Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IGh3LT5ucl92cmluZzsgaSsrKSB7Cj4gKwkJc3luY2hy
b25pemVfdnFfaXJxKGh3KTsKPiArCQlody0+dnJpbmdbaV0uY2IuY2FsbGJhY2sgPSBOVUxMOwo+
ICsJCWh3LT52cmluZ1tpXS5jYi5wcml2YXRlID0gTlVMTDsKPiArCQlpZmN2Zl9zZXRfdnFfdmVj
dG9yKGh3LCBpLCBWSVJUSU9fTVNJX05PX1ZFQ1RPUik7Cj4gKwl9Cj4gK30KPiArCj4gK3N0YXRp
YyB2b2lkIGlmY3ZmX3Jlc2V0X2NvbmZpZ19oYW5kbGVyKHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4g
K3sKPiArCXN5bmNocm9uaXplX2NvbmZpZ19pcnEoaHcpOwo+ICsJaHctPmNvbmZpZ19jYi5jYWxs
YmFjayA9IE5VTEw7Cj4gKwlody0+Y29uZmlnX2NiLnByaXZhdGUgPSBOVUxMOwo+ICsJaWZjdmZf
c2V0X2NvbmZpZ192ZWN0b3IoaHcsIFZJUlRJT19NU0lfTk9fVkVDVE9SKTsKPiAgIH0KPiAgIAo+
ICAgdm9pZCBpZmN2Zl9zdG9wX2h3KHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4gICB7Cj4gLQlpZmN2
Zl9od19kaXNhYmxlKGh3KTsKPiAtCWlmY3ZmX3Jlc2V0KGh3KTsKPiArCWlmY3ZmX3Jlc2V0X3Zy
aW5nKGh3KTsKPiArCWlmY3ZmX3Jlc2V0X2NvbmZpZ19oYW5kbGVyKGh3KTsKPiAgIH0KPiAgIAo+
ICAgdm9pZCBpZmN2Zl9ub3RpZnlfcXVldWUoc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2IHFpZCkK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaCBiL2RyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmgKPiBpbmRleCAxMTViNjFmNDkyNGIuLmYzZGNlMGQ3OTVj
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5oCj4gKysrIGIv
ZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaAo+IEBAIC00OSwxMiArNDksNiBAQAo+ICAg
I2RlZmluZSBNU0lYX1ZFQ1RPUl9ERVZfU0hBUkVECQkJMwo+ICAgCj4gICBzdHJ1Y3QgdnJpbmdf
aW5mbyB7Cj4gLQl1NjQgZGVzYzsKPiAtCXU2NCBhdmFpbDsKPiAtCXU2NCB1c2VkOwo+IC0JdTE2
IHNpemU7Cj4gLQl1MTYgbGFzdF9hdmFpbF9pZHg7Cj4gLQlib29sIHJlYWR5Owo+ICAgCXZvaWQg
X19pb21lbSAqbm90aWZ5X2FkZHI7Cj4gICAJcGh5c19hZGRyX3Qgbm90aWZ5X3BhOwo+ICAgCXUz
MiBpcnE7Cj4gQEAgLTc2LDcgKzcwLDYgQEAgc3RydWN0IGlmY3ZmX2h3IHsKPiAgIAlwaHlzX2Fk
ZHJfdCBub3RpZnlfYmFzZV9wYTsKPiAgIAl1MzIgbm90aWZ5X29mZl9tdWx0aXBsaWVyOwo+ICAg
CXUzMiBkZXZfdHlwZTsKPiAtCXU2NCByZXFfZmVhdHVyZXM7Cj4gICAJdTY0IGh3X2ZlYXR1cmVz
Owo+ICAgCXN0cnVjdCB2aXJ0aW9fcGNpX2NvbW1vbl9jZmcgX19pb21lbSAqY29tbW9uX2NmZzsK
PiAgIAl2b2lkIF9faW9tZW0gKmRldl9jZmc7Cj4gQEAgLTEyMyw3ICsxMTYsNyBAQCB1OCBpZmN2
Zl9nZXRfc3RhdHVzKHN0cnVjdCBpZmN2Zl9odyAqaHcpOwo+ICAgdm9pZCBpZmN2Zl9zZXRfc3Rh
dHVzKHN0cnVjdCBpZmN2Zl9odyAqaHcsIHU4IHN0YXR1cyk7Cj4gICB2b2lkIGlvX3dyaXRlNjRf
dHdvcGFydCh1NjQgdmFsLCB1MzIgKmxvLCB1MzIgKmhpKTsKPiAgIHZvaWQgaWZjdmZfcmVzZXQo
c3RydWN0IGlmY3ZmX2h3ICpodyk7Cj4gLXU2NCBpZmN2Zl9nZXRfZmVhdHVyZXMoc3RydWN0IGlm
Y3ZmX2h3ICpodyk7Cj4gK3U2NCBpZmN2Zl9nZXRfZGV2aWNlX2ZlYXR1cmVzKHN0cnVjdCBpZmN2
Zl9odyAqaHcpOwo+ICAgdTY0IGlmY3ZmX2dldF9od19mZWF0dXJlcyhzdHJ1Y3QgaWZjdmZfaHcg
Kmh3KTsKPiAgIGludCBpZmN2Zl92ZXJpZnlfbWluX2ZlYXR1cmVzKHN0cnVjdCBpZmN2Zl9odyAq
aHcsIHU2NCBmZWF0dXJlcyk7Cj4gICB1MTYgaWZjdmZfZ2V0X3ZxX3N0YXRlKHN0cnVjdCBpZmN2
Zl9odyAqaHcsIHUxNiBxaWQpOwo+IEBAIC0xMzEsNiArMTI0LDEzIEBAIGludCBpZmN2Zl9zZXRf
dnFfc3RhdGUoc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2IHFpZCwgdTE2IG51bSk7Cj4gICBzdHJ1
Y3QgaWZjdmZfYWRhcHRlciAqdmZfdG9fYWRhcHRlcihzdHJ1Y3QgaWZjdmZfaHcgKmh3KTsKPiAg
IGludCBpZmN2Zl9wcm9iZWRfdmlydGlvX25ldChzdHJ1Y3QgaWZjdmZfaHcgKmh3KTsKPiAgIHUz
MiBpZmN2Zl9nZXRfY29uZmlnX3NpemUoc3RydWN0IGlmY3ZmX2h3ICpodyk7Cj4gK2ludCBpZmN2
Zl9zZXRfdnFfYWRkcmVzcyhzdHJ1Y3QgaWZjdmZfaHcgKmh3LCB1MTYgcWlkLCB1NjQgZGVzY19h
cmVhLAo+ICsJCQkgdTY0IGRyaXZlcl9hcmVhLCB1NjQgZGV2aWNlX2FyZWEpOwo+ICAgdTE2IGlm
Y3ZmX3NldF92cV92ZWN0b3Ioc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2IHFpZCwgaW50IHZlY3Rv
cik7Cj4gICB1MTYgaWZjdmZfc2V0X2NvbmZpZ192ZWN0b3Ioc3RydWN0IGlmY3ZmX2h3ICpodywg
aW50IHZlY3Rvcik7Cj4gK3ZvaWQgaWZjdmZfc2V0X3ZxX251bShzdHJ1Y3QgaWZjdmZfaHcgKmh3
LCB1MTYgcWlkLCB1MzIgbnVtKTsKPiArdm9pZCBpZmN2Zl9zZXRfdnFfcmVhZHkoc3RydWN0IGlm
Y3ZmX2h3ICpodywgdTE2IHFpZCwgYm9vbCByZWFkeSk7Cj4gK2Jvb2wgaWZjdmZfZ2V0X3ZxX3Jl
YWR5KHN0cnVjdCBpZmN2Zl9odyAqaHcsIHUxNiBxaWQpOwo+ICt2b2lkIGlmY3ZmX3NldF9mZWF0
dXJlcyhzdHJ1Y3QgaWZjdmZfaHcgKmh3LCB1NjQgZmVhdHVyZXMpOwo+ICt1NjQgaWZjdmZfZ2V0
X2ZlYXR1cmVzKHN0cnVjdCBpZmN2Zl9odyAqaHcpOwo+ICAgI2VuZGlmIC8qIF9JRkNWRl9IXyAq
Lwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIGIvZHJpdmVy
cy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IGluZGV4IDQzNjYzMjBmYjY4ZC4uMDI1N2JhOThj
ZmZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiArKysg
Yi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAgLTM1OCw1MyArMzU4LDYgQEAg
c3RhdGljIGludCBpZmN2Zl9yZXF1ZXN0X2lycShzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRl
cikKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGlmY3ZmX3N0YXJ0X2Rh
dGFwYXRoKHZvaWQgKnByaXZhdGUpCj4gLXsKPiAtCXN0cnVjdCBpZmN2Zl9odyAqdmYgPSBpZmN2
Zl9wcml2YXRlX3RvX3ZmKHByaXZhdGUpOwo+IC0JdTggc3RhdHVzOwo+IC0JaW50IHJldDsKPiAt
Cj4gLQlyZXQgPSBpZmN2Zl9zdGFydF9odyh2Zik7Cj4gLQlpZiAocmV0IDwgMCkgewo+IC0JCXN0
YXR1cyA9IGlmY3ZmX2dldF9zdGF0dXModmYpOwo+IC0JCXN0YXR1cyB8PSBWSVJUSU9fQ09ORklH
X1NfRkFJTEVEOwo+IC0JCWlmY3ZmX3NldF9zdGF0dXModmYsIHN0YXR1cyk7Cj4gLQl9Cj4gLQo+
IC0JcmV0dXJuIHJldDsKPiAtfQo+IC0KPiAtc3RhdGljIGludCBpZmN2Zl9zdG9wX2RhdGFwYXRo
KHZvaWQgKnByaXZhdGUpCj4gLXsKPiAtCXN0cnVjdCBpZmN2Zl9odyAqdmYgPSBpZmN2Zl9wcml2
YXRlX3RvX3ZmKHByaXZhdGUpOwo+IC0JaW50IGk7Cj4gLQo+IC0JZm9yIChpID0gMDsgaSA8IHZm
LT5ucl92cmluZzsgaSsrKQo+IC0JCXZmLT52cmluZ1tpXS5jYi5jYWxsYmFjayA9IE5VTEw7Cj4g
LQo+IC0JaWZjdmZfc3RvcF9odyh2Zik7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gLX0KPiAtCj4gLXN0
YXRpYyB2b2lkIGlmY3ZmX3Jlc2V0X3ZyaW5nKHN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVy
KQo+IC17Cj4gLQlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gaWZjdmZfcHJpdmF0ZV90b192ZihhZGFw
dGVyKTsKPiAtCWludCBpOwo+IC0KPiAtCWZvciAoaSA9IDA7IGkgPCB2Zi0+bnJfdnJpbmc7IGkr
Kykgewo+IC0JCXZmLT52cmluZ1tpXS5sYXN0X2F2YWlsX2lkeCA9IDA7Cj4gLQkJdmYtPnZyaW5n
W2ldLmRlc2MgPSAwOwo+IC0JCXZmLT52cmluZ1tpXS5hdmFpbCA9IDA7Cj4gLQkJdmYtPnZyaW5n
W2ldLnVzZWQgPSAwOwo+IC0JCXZmLT52cmluZ1tpXS5yZWFkeSA9IDA7Cj4gLQkJdmYtPnZyaW5n
W2ldLmNiLmNhbGxiYWNrID0gTlVMTDsKPiAtCQl2Zi0+dnJpbmdbaV0uY2IucHJpdmF0ZSA9IE5V
TEw7Cj4gLQl9Cj4gLQo+IC0JaWZjdmZfcmVzZXQodmYpOwo+IC19Cj4gLQo+ICAgc3RhdGljIHN0
cnVjdCBpZmN2Zl9hZGFwdGVyICp2ZHBhX3RvX2FkYXB0ZXIoc3RydWN0IHZkcGFfZGV2aWNlICp2
ZHBhX2RldikKPiAgIHsKPiAgIAlyZXR1cm4gY29udGFpbmVyX29mKHZkcGFfZGV2LCBzdHJ1Y3Qg
aWZjdmZfYWRhcHRlciwgdmRwYSk7Cj4gQEAgLTQyNiw3ICszNzksNyBAQCBzdGF0aWMgdTY0IGlm
Y3ZmX3ZkcGFfZ2V0X2RldmljZV9mZWF0dXJlcyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGFfZGV2
KQo+ICAgCXU2NCBmZWF0dXJlczsKPiAgIAo+ICAgCWlmICh0eXBlID09IFZJUlRJT19JRF9ORVQg
fHwgdHlwZSA9PSBWSVJUSU9fSURfQkxPQ0spCj4gLQkJZmVhdHVyZXMgPSBpZmN2Zl9nZXRfZmVh
dHVyZXModmYpOwo+ICsJCWZlYXR1cmVzID0gaWZjdmZfZ2V0X2RldmljZV9mZWF0dXJlcyh2Zik7
Cj4gICAJZWxzZSB7Cj4gICAJCWZlYXR1cmVzID0gMDsKPiAgIAkJSUZDVkZfRVJSKHBkZXYsICJW
SVJUSU8gSUQgJXUgbm90IHN1cHBvcnRlZFxuIiwgdmYtPmRldl90eXBlKTsKPiBAQCAtNDQ0LDcg
KzM5Nyw3IEBAIHN0YXRpYyBpbnQgaWZjdmZfdmRwYV9zZXRfZHJpdmVyX2ZlYXR1cmVzKHN0cnVj
dCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsIHU2NCBmZWF0Cj4gICAJaWYgKHJldCkKPiAgIAkJcmV0
dXJuIHJldDsKPiAgIAo+IC0JdmYtPnJlcV9mZWF0dXJlcyA9IGZlYXR1cmVzOwo+ICsJaWZjdmZf
c2V0X2ZlYXR1cmVzKHZmLCBmZWF0dXJlcyk7Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiBA
QCAtNDUzLDcgKzQwNiw3IEBAIHN0YXRpYyB1NjQgaWZjdmZfdmRwYV9nZXRfZHJpdmVyX2ZlYXR1
cmVzKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYpCj4gICB7Cj4gICAJc3RydWN0IGlmY3Zm
X2h3ICp2ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICAgCj4gLQlyZXR1cm4gdmYtPnJlcV9m
ZWF0dXJlczsKPiArCXJldHVybiBpZmN2Zl9nZXRfZmVhdHVyZXModmYpOwo+ICAgfQo+ICAgCj4g
ICBzdGF0aWMgdTggaWZjdmZfdmRwYV9nZXRfc3RhdHVzKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YV9kZXYpCj4gQEAgLTQ4NiwxMSArNDM5LDYgQEAgc3RhdGljIHZvaWQgaWZjdmZfdmRwYV9zZXRf
c3RhdHVzKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsIHU4IHN0YXR1cykKPiAgIAkJCWlm
Y3ZmX3NldF9zdGF0dXModmYsIHN0YXR1cyk7Cj4gICAJCQlyZXR1cm47Cj4gICAJCX0KPiAtCj4g
LQkJaWYgKGlmY3ZmX3N0YXJ0X2RhdGFwYXRoKGFkYXB0ZXIpIDwgMCkKPiAtCQkJSUZDVkZfRVJS
KGFkYXB0ZXItPnBkZXYsCj4gLQkJCQkgICJGYWlsZWQgdG8gc2V0IGlmY3ZmIHZkcGEgIHN0YXR1
cyAldVxuIiwKPiAtCQkJCSAgc3RhdHVzKTsKPiAgIAl9Cj4gICAKPiAgIAlpZmN2Zl9zZXRfc3Rh
dHVzKHZmLCBzdGF0dXMpOwo+IEBAIC01MDksMTIgKzQ1NywxMCBAQCBzdGF0aWMgaW50IGlmY3Zm
X3ZkcGFfcmVzZXQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldikKPiAgIAlpZiAoc3RhdHVz
X29sZCA9PSAwKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+IC0JaWYgKHN0YXR1c19vbGQgJiBWSVJU
SU9fQ09ORklHX1NfRFJJVkVSX09LKSB7Cj4gLQkJaWZjdmZfc3RvcF9kYXRhcGF0aChhZGFwdGVy
KTsKPiAtCQlpZmN2Zl9mcmVlX2lycShhZGFwdGVyKTsKPiAtCX0KPiArCWlmY3ZmX3N0b3BfaHco
dmYpOwo+ICsJaWZjdmZfZnJlZV9pcnEoYWRhcHRlcik7Cj4gICAKPiAtCWlmY3ZmX3Jlc2V0X3Zy
aW5nKGFkYXB0ZXIpOwo+ICsJaWZjdmZfcmVzZXQodmYpOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4g
ICB9Cj4gQEAgLTU1NCwxNCArNTAwLDE3IEBAIHN0YXRpYyB2b2lkIGlmY3ZmX3ZkcGFfc2V0X3Zx
X3JlYWR5KHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsCj4gICB7Cj4gICAJc3RydWN0IGlm
Y3ZmX2h3ICp2ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICAgCj4gLQl2Zi0+dnJpbmdbcWlk
XS5yZWFkeSA9IHJlYWR5Owo+ICsJaWZjdmZfc2V0X3ZxX3JlYWR5KHZmLCBxaWQsIHJlYWR5KTsK
PiAgIH0KPiAgIAo+ICAgc3RhdGljIGJvb2wgaWZjdmZfdmRwYV9nZXRfdnFfcmVhZHkoc3RydWN0
IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTE2IHFpZCkKPiAgIHsKPiAgIAlzdHJ1Y3QgaWZjdmZf
aHcgKnZmID0gdmRwYV90b192Zih2ZHBhX2Rldik7Cj4gKwlib29sIHJlYWR5Owo+ICsKPiArCXJl
YWR5ID0gaWZjdmZfZ2V0X3ZxX3JlYWR5KHZmLCBxaWQpOwo+ICAgCj4gLQlyZXR1cm4gdmYtPnZy
aW5nW3FpZF0ucmVhZHk7Cj4gKwlyZXR1cm4gcmVhZHk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2
b2lkIGlmY3ZmX3ZkcGFfc2V0X3ZxX251bShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGFfZGV2LCB1
MTYgcWlkLAo+IEBAIC01NjksNyArNTE4LDcgQEAgc3RhdGljIHZvaWQgaWZjdmZfdmRwYV9zZXRf
dnFfbnVtKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsIHUxNiBxaWQsCj4gICB7Cj4gICAJ
c3RydWN0IGlmY3ZmX2h3ICp2ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICAgCj4gLQl2Zi0+
dnJpbmdbcWlkXS5zaXplID0gbnVtOwo+ICsJaWZjdmZfc2V0X3ZxX251bSh2ZiwgcWlkLCBudW0p
Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IGlmY3ZmX3ZkcGFfc2V0X3ZxX2FkZHJlc3Moc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTE2IHFpZCwKPiBAQCAtNTc4LDExICs1MjcsNyBA
QCBzdGF0aWMgaW50IGlmY3ZmX3ZkcGFfc2V0X3ZxX2FkZHJlc3Moc3RydWN0IHZkcGFfZGV2aWNl
ICp2ZHBhX2RldiwgdTE2IHFpZCwKPiAgIHsKPiAgIAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gdmRw
YV90b192Zih2ZHBhX2Rldik7Cj4gICAKPiAtCXZmLT52cmluZ1txaWRdLmRlc2MgPSBkZXNjX2Fy
ZWE7Cj4gLQl2Zi0+dnJpbmdbcWlkXS5hdmFpbCA9IGRyaXZlcl9hcmVhOwo+IC0JdmYtPnZyaW5n
W3FpZF0udXNlZCA9IGRldmljZV9hcmVhOwo+IC0KPiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIGlm
Y3ZmX3NldF92cV9hZGRyZXNzKHZmLCBxaWQsIGRlc2NfYXJlYSwgZHJpdmVyX2FyZWEsIGRldmlj
ZV9hcmVhKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgaWZjdmZfdmRwYV9raWNrX3ZxKHN0
cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsIHUxNiBxaWQpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
