Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D78173C1D87
	for <lists.virtualization@lfdr.de>; Fri,  9 Jul 2021 04:37:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7FA42253;
	Fri,  9 Jul 2021 02:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pk5vcyr_L7Br; Fri,  9 Jul 2021 02:37:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2807442258;
	Fri,  9 Jul 2021 02:37:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91213C000E;
	Fri,  9 Jul 2021 02:37:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28AD0C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 02:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3CC36065A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 02:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Otmn9AvcsJ7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 02:37:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B444605FA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 02:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625798246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J9Lnw5DVtWJKPf6tEyqz5oiUm5AxvYYKjyiKxoR3zk=;
 b=PWqlOr0CqWYm8P82lZpQEHGUEkWzR2yth5uzce/hKAUxckqw5GElSNRtU4rlspGwsed9RU
 UEoGEdNcOdiw2DQ3aeaia0IJjwMqydBJCQ68/ju2si3kNCMzTydcy+VALhAHzinxvfqro+
 t/pMlplWUv6+Yubr2KoLw299o4sal6A=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-rdhYp0bFNIWm6emtlXoqjw-1; Thu, 08 Jul 2021 22:37:25 -0400
X-MC-Unique: rdhYp0bFNIWm6emtlXoqjw-1
Received: by mail-pl1-f197.google.com with SMTP id
 c24-20020a1709028498b0290128cdfbb2f1so2631827plo.14
 for <virtualization@lists.linux-foundation.org>;
 Thu, 08 Jul 2021 19:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+J9Lnw5DVtWJKPf6tEyqz5oiUm5AxvYYKjyiKxoR3zk=;
 b=kpYPgd/gV124hf/cn9PoVt9HD6Q5axCHk7tovOcL3lD9myPMv/oopzjtkIJY+Xy5+y
 fuSvygX4XbArAHWdQspq0R8MdTnAVH5vIUDfq9NjNAKVhJC2tbNEvQgfkbdstsEcqzoT
 sLhnJI8FJddPI7NBgnkZBrtNDGxqkLe5FhUFrL5Iswvb0UDfZ8Qv40A4GSadqthQuZGZ
 JYbIUh9/mHTWLb1zSBqx4DzI9wqIdWtQoVTgo4B6xqxCj19bN2hMV1EPD5ZSxGYEbeZW
 kDwrV0clYI8VRZA4oqRAeB73eTO0PSbn2ymQ2oH+gY3YmBgwD5Ii6TTc/sS22rYQxKaC
 BOKw==
X-Gm-Message-State: AOAM531ZTTliWyBwMURZSLIgfACwkJgrsjuAZ0YUHnLM51bA0WJXCBQw
 dAouwhpjGVPfOlS3kuZMTuIkDQzTuv5IO+Q0iatVQnEBczA5IKOcppOjO2cw5Q3TJnnW0zhbQ9e
 P0w0zff508tb5j51Ew9phVnhv+dfyUJAdqzpbVFl1gw==
X-Received: by 2002:a65:5b0f:: with SMTP id y15mr35436076pgq.263.1625798244862; 
 Thu, 08 Jul 2021 19:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW1VzzGMbGReLBmXJmIGxaq1O7VrIc2ROGTJpNodFzrGiyhKCxtsCzrfwEi9MUAlff62XWmg==
X-Received: by 2002:a65:5b0f:: with SMTP id y15mr35436050pgq.263.1625798244629; 
 Thu, 08 Jul 2021 19:37:24 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id lb13sm10506564pjb.5.2021.07.08.19.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 19:37:24 -0700 (PDT)
Subject: Re: [PATCH V3 2/2] vDPA/ifcvf: implement management netlink framework
 for ifcvf
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com
References: <20210706023649.23360-1-lingshan.zhu@intel.com>
 <20210706023649.23360-3-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d965cd00-387e-3610-6c9c-50f99574438e@redhat.com>
Date: Fri, 9 Jul 2021 10:37:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706023649.23360-3-lingshan.zhu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNy82IMnPzucxMDozNiwgWmh1IExpbmdzaGFuINC0tcA6Cj4gVGhpcyBjb21taXQg
aW1wbGVtZW50cyB0aGUgbWFuYWdlbWVudCBuZXRsaW5rIGZyYW1ld29yayBmb3IgaWZjdmYsCj4g
aW5jbHVkaW5nIHJlZ2lzdGVyIGFuZCBhZGQgLyByZW1vdmUgYSBkZXZpY2UKPgo+IEl0IHdvcmtz
IHdpdGggaXByb3V0ZTI6Cj4gW3Jvb3RAbG9jYWxob3N0IGxzemh1XSMgdmRwYSBtZ210ZGV2IHNo
b3cgLWpwCj4gewo+ICAgICAgIm1nbXRkZXYiOiB7Cj4gICAgICAgICAgInBjaS8wMDAwOjAxOjAw
LjUiOiB7Cj4gICAgICAgICAgICAgICJzdXBwb3J0ZWRfY2xhc3NlcyI6IFsgIm5ldCIgXQo+ICAg
ICAgICAgIH0sCj4gICAgICAgICAgInBjaS8wMDAwOjAxOjAwLjYiOiB7Cj4gICAgICAgICAgICAg
ICJzdXBwb3J0ZWRfY2xhc3NlcyI6IFsgIm5ldCIgXQo+ICAgICAgICAgIH0KPiAgICAgIH0KPiB9
Cj4KPiBbcm9vdEBsb2NhbGhvc3QgbHN6aHVdIyB2ZHBhIGRldiBhZGQgbWdtdGRldiBwY2kvMDAw
MDowMTowMC41IG5hbWUgdmRwYTAKPiBbcm9vdEBsb2NhbGhvc3QgbHN6aHVdIyB2ZHBhIGRldiBh
ZGQgbWdtdGRldiBwY2kvMDAwMDowMTowMC42IG5hbWUgdmRwYTEKPgo+IFNpZ25lZC1vZmYtYnk6
IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KCgpBY2tlZC1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+IC0tLQo+ICAgZHJpdmVycy92ZHBhL2lmY3Zm
L2lmY3ZmX2Jhc2UuaCB8ICAgNiArKwo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4u
YyB8IDE1NCArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaCBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2
Zl9iYXNlLmgKPiBpbmRleCBkZWQxYjFiNWZiMTMuLmU1MjUxZmNiYjIwMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5oCj4gKysrIGIvZHJpdmVycy92ZHBhL2lm
Y3ZmL2lmY3ZmX2Jhc2UuaAo+IEBAIC0xMDQsNiArMTA0LDEyIEBAIHN0cnVjdCBpZmN2Zl9sbV9j
Zmcgewo+ICAgCXN0cnVjdCBpZmN2Zl92cmluZ19sbV9jZmcgdnJpbmdfbG1fY2ZnW0lGQ1ZGX01B
WF9RVUVVRV9QQUlSU107Cj4gICB9Owo+ICAgCj4gK3N0cnVjdCBpZmN2Zl92ZHBhX21nbXRfZGV2
IHsKPiArCXN0cnVjdCB2ZHBhX21nbXRfZGV2IG1kZXY7Cj4gKwlzdHJ1Y3QgaWZjdmZfYWRhcHRl
ciAqYWRhcHRlcjsKPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2Owo+ICt9Owo+ICsKPiAgIGludCBp
ZmN2Zl9pbml0X2h3KHN0cnVjdCBpZmN2Zl9odyAqaHcsIHN0cnVjdCBwY2lfZGV2ICpkZXYpOwo+
ICAgaW50IGlmY3ZmX3N0YXJ0X2h3KHN0cnVjdCBpZmN2Zl9odyAqaHcpOwo+ICAgdm9pZCBpZmN2
Zl9zdG9wX2h3KHN0cnVjdCBpZmN2Zl9odyAqaHcpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zk
cGEvaWZjdmYvaWZjdmZfbWFpbi5jIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+
IGluZGV4IDVmNzBhYjEyODNhMC4uYzcyZDliMzZlNGEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZf
bWFpbi5jCj4gQEAgLTIxOCw3ICsyMTgsNyBAQCBzdGF0aWMgdm9pZCBpZmN2Zl92ZHBhX3NldF9z
dGF0dXMoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTggc3RhdHVzKQo+ICAgCWludCBy
ZXQ7Cj4gICAKPiAgIAl2ZiAgPSB2ZHBhX3RvX3ZmKHZkcGFfZGV2KTsKPiAtCWFkYXB0ZXIgPSBk
ZXZfZ2V0X2RydmRhdGEodmRwYV9kZXYtPmRldi5wYXJlbnQpOwo+ICsJYWRhcHRlciA9IHZkcGFf
dG9fYWRhcHRlcih2ZHBhX2Rldik7Cj4gICAJc3RhdHVzX29sZCA9IGlmY3ZmX2dldF9zdGF0dXMo
dmYpOwo+ICAgCj4gICAJaWYgKHN0YXR1c19vbGQgPT0gc3RhdHVzKQo+IEBAIC00NDIsNiArNDQy
LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzIGlmY192ZHBhX29wcyA9
IHsKPiAgIAkuc2V0X2NvbmZpZ19jYiAgPSBpZmN2Zl92ZHBhX3NldF9jb25maWdfY2IsCj4gICB9
Owo+ICAgCj4gK3N0YXRpYyBzdHJ1Y3QgdmlydGlvX2RldmljZV9pZCBpZF90YWJsZV9uZXRbXSA9
IHsKPiArCXtWSVJUSU9fSURfTkVULCBWSVJUSU9fREVWX0FOWV9JRH0sCj4gKwl7MH0sCj4gK307
Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHZpcnRpb19kZXZpY2VfaWQgaWRfdGFibGVfYmxrW10gPSB7
Cj4gKwl7VklSVElPX0lEX0JMT0NLLCBWSVJUSU9fREVWX0FOWV9JRH0sCj4gKwl7MH0sCj4gK307
Cj4gKwo+ICAgc3RhdGljIHUzMiBnZXRfZGV2X3R5cGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4g
ICB7Cj4gICAJdTMyIGRldl90eXBlOwo+IEBAIC00NjIsNDggKzQ3MiwzMCBAQCBzdGF0aWMgdTMy
IGdldF9kZXZfdHlwZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiAgIAlyZXR1cm4gZGV2X3R5cGU7
Cj4gICB9Cj4gICAKPiAtc3RhdGljIGludCBpZmN2Zl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+ICtzdGF0aWMgaW50IGlmY3ZmX3Zk
cGFfZGV2X2FkZChzdHJ1Y3QgdmRwYV9tZ210X2RldiAqbWRldiwgY29uc3QgY2hhciAqbmFtZSkK
PiAgIHsKPiAtCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gKwlzdHJ1Y3QgaWZj
dmZfdmRwYV9tZ210X2RldiAqaWZjdmZfbWdtdF9kZXY7Cj4gICAJc3RydWN0IGlmY3ZmX2FkYXB0
ZXIgKmFkYXB0ZXI7Cj4gKwlzdHJ1Y3QgcGNpX2RldiAqcGRldjsKPiAgIAlzdHJ1Y3QgaWZjdmZf
aHcgKnZmOwo+ICsJc3RydWN0IGRldmljZSAqZGV2Owo+ICAgCWludCByZXQsIGk7Cj4gICAKPiAt
CXJldCA9IHBjaW1fZW5hYmxlX2RldmljZShwZGV2KTsKPiAtCWlmIChyZXQpIHsKPiAtCQlJRkNW
Rl9FUlIocGRldiwgIkZhaWxlZCB0byBlbmFibGUgZGV2aWNlXG4iKTsKPiAtCQlyZXR1cm4gcmV0
Owo+IC0JfQo+IC0KPiAtCXJldCA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCBCSVQoMCkgfCBC
SVQoMikgfCBCSVQoNCksCj4gLQkJCQkgSUZDVkZfRFJJVkVSX05BTUUpOwo+IC0JaWYgKHJldCkg
ewo+IC0JCUlGQ1ZGX0VSUihwZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgTU1JTyByZWdpb25cbiIp
Owo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+IC0JcmV0ID0gZG1hX3NldF9tYXNrX2FuZF9j
b2hlcmVudChkZXYsIERNQV9CSVRfTUFTSyg2NCkpOwo+IC0JaWYgKHJldCkgewo+IC0JCUlGQ1ZG
X0VSUihwZGV2LCAiTm8gdXNhYmxlIERNQSBjb25maWd1cmF0aW9uXG4iKTsKPiAtCQlyZXR1cm4g
cmV0Owo+IC0JfQo+IC0KPiAtCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGlm
Y3ZmX2ZyZWVfaXJxX3ZlY3RvcnMsIHBkZXYpOwo+IC0JaWYgKHJldCkgewo+IC0JCUlGQ1ZGX0VS
UihwZGV2LAo+IC0JCQkgICJGYWlsZWQgZm9yIGFkZGluZyBkZXZyZXMgZm9yIGZyZWVpbmcgaXJx
IHZlY3RvcnNcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gKwlpZmN2Zl9tZ210X2RldiA9
IGNvbnRhaW5lcl9vZihtZGV2LCBzdHJ1Y3QgaWZjdmZfdmRwYV9tZ210X2RldiwgbWRldik7Cj4g
KwlpZiAoaWZjdmZfbWdtdF9kZXYtPmFkYXB0ZXIpCj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+
ICAgCj4gKwlwZGV2ID0gaWZjdmZfbWdtdF9kZXYtPnBkZXY7Cj4gKwlkZXYgPSAmcGRldi0+ZGV2
Owo+ICAgCWFkYXB0ZXIgPSB2ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgaWZjdmZfYWRhcHRlciwg
dmRwYSwKPiAtCQkJCSAgICBkZXYsICZpZmNfdmRwYV9vcHMsIE5VTEwpOwo+IC0JaWYgKGFkYXB0
ZXIgPT0gTlVMTCkgewo+ICsJCQkJICAgIGRldiwgJmlmY192ZHBhX29wcywgbmFtZSk7Cj4gKwlp
ZiAoIWFkYXB0ZXIpIHsKPiAgIAkJSUZDVkZfRVJSKHBkZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUg
dkRQQSBzdHJ1Y3R1cmUiKTsKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAJfQo+ICAgCj4gLQlw
Y2lfc2V0X21hc3RlcihwZGV2KTsKPiAtCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBhZGFwdGVyKTsK
PiArCWlmY3ZmX21nbXRfZGV2LT5hZGFwdGVyID0gYWRhcHRlcjsKPiArCXBjaV9zZXRfZHJ2ZGF0
YShwZGV2LCBpZmN2Zl9tZ210X2Rldik7Cj4gICAKPiAgIAl2ZiA9ICZhZGFwdGVyLT52ZjsKPiAg
IAl2Zi0+ZGV2X3R5cGUgPSBnZXRfZGV2X3R5cGUocGRldik7Cj4gQEAgLTUyMyw5ICs1MTUsMTAg
QEAgc3RhdGljIGludCBpZmN2Zl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+ICAgCj4gICAJdmYtPmh3X2ZlYXR1cmVzID0gaWZjdmZf
Z2V0X2h3X2ZlYXR1cmVzKHZmKTsKPiAgIAo+IC0JcmV0ID0gdmRwYV9yZWdpc3Rlcl9kZXZpY2Uo
JmFkYXB0ZXItPnZkcGEsIElGQ1ZGX01BWF9RVUVVRV9QQUlSUyAqIDIpOwo+ICsJYWRhcHRlci0+
dmRwYS5tZGV2ID0gJmlmY3ZmX21nbXRfZGV2LT5tZGV2Owo+ICsJcmV0ID0gX3ZkcGFfcmVnaXN0
ZXJfZGV2aWNlKCZhZGFwdGVyLT52ZHBhLCBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyKTsKPiAg
IAlpZiAocmV0KSB7Cj4gLQkJSUZDVkZfRVJSKHBkZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgaWZj
dmYgdG8gdmRwYSBidXMiKTsKPiArCQlJRkNWRl9FUlIocGRldiwgIkZhaWxlZCB0byByZWdpc3Rl
ciB0byB2RFBBIGJ1cyIpOwo+ICAgCQlnb3RvIGVycjsKPiAgIAl9Cj4gICAKPiBAQCAtNTM2LDEx
ICs1MjksMTAwIEBAIHN0YXRpYyBpbnQgaWZjdmZfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+
ICAgCj4gK3N0YXRpYyB2b2lkIGlmY3ZmX3ZkcGFfZGV2X2RlbChzdHJ1Y3QgdmRwYV9tZ210X2Rl
diAqbWRldiwgc3RydWN0IHZkcGFfZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCBpZmN2Zl92
ZHBhX21nbXRfZGV2ICppZmN2Zl9tZ210X2RldjsKPiArCj4gKwlpZmN2Zl9tZ210X2RldiA9IGNv
bnRhaW5lcl9vZihtZGV2LCBzdHJ1Y3QgaWZjdmZfdmRwYV9tZ210X2RldiwgbWRldik7Cj4gKwlf
dmRwYV91bnJlZ2lzdGVyX2RldmljZShkZXYpOwo+ICsJaWZjdmZfbWdtdF9kZXYtPmFkYXB0ZXIg
PSBOVUxMOwo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfbWdtdGRldl9vcHMg
aWZjdmZfdmRwYV9tZ210X2Rldl9vcHMgPSB7Cj4gKwkuZGV2X2FkZCA9IGlmY3ZmX3ZkcGFfZGV2
X2FkZCwKPiArCS5kZXZfZGVsID0gaWZjdmZfdmRwYV9kZXZfZGVsCj4gK307Cj4gKwo+ICtzdGF0
aWMgaW50IGlmY3ZmX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqaWQpCj4gK3sKPiArCXN0cnVjdCBpZmN2Zl92ZHBhX21nbXRfZGV2ICppZmN2
Zl9tZ210X2RldjsKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gKwl1MzIg
ZGV2X3R5cGU7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCWlmY3ZmX21nbXRfZGV2ID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IGlmY3ZmX3ZkcGFfbWdtdF9kZXYpLCBHRlBfS0VSTkVMKTsKPiArCWlmICgh
aWZjdmZfbWdtdF9kZXYpIHsKPiArCQlJRkNWRl9FUlIocGRldiwgIkZhaWxlZCB0byBhbGxvYyBt
ZW1vcnkgZm9yIHRoZSB2RFBBIG1hbmFnZW1lbnQgZGV2aWNlXG4iKTsKPiArCQlyZXR1cm4gLUVO
T01FTTsKPiArCX0KPiArCj4gKwlkZXZfdHlwZSA9IGdldF9kZXZfdHlwZShwZGV2KTsKPiArCXN3
aXRjaCAoZGV2X3R5cGUpIHsKPiArCWNhc2UgVklSVElPX0lEX05FVDoKPiArCQlpZmN2Zl9tZ210
X2Rldi0+bWRldi5pZF90YWJsZSA9IGlkX3RhYmxlX25ldDsKPiArCQlicmVhazsKPiArCWNhc2Ug
VklSVElPX0lEX0JMT0NLOgo+ICsJCWlmY3ZmX21nbXRfZGV2LT5tZGV2LmlkX3RhYmxlID0gaWRf
dGFibGVfYmxrOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQlJRkNWRl9FUlIocGRldiwg
IlZJUlRJTyBJRCAldSBub3Qgc3VwcG9ydGVkXG4iLCBkZXZfdHlwZSk7Cj4gKwkJcmV0ID0gLUVP
UE5PVFNVUFA7Cj4gKwkJZ290byBlcnI7Cj4gKwl9Cj4gKwo+ICsJaWZjdmZfbWdtdF9kZXYtPm1k
ZXYub3BzID0gJmlmY3ZmX3ZkcGFfbWdtdF9kZXZfb3BzOwo+ICsJaWZjdmZfbWdtdF9kZXYtPm1k
ZXYuZGV2aWNlID0gZGV2Owo+ICsJaWZjdmZfbWdtdF9kZXYtPnBkZXYgPSBwZGV2Owo+ICsKPiAr
CXJldCA9IHBjaW1fZW5hYmxlX2RldmljZShwZGV2KTsKPiArCWlmIChyZXQpIHsKPiArCQlJRkNW
Rl9FUlIocGRldiwgIkZhaWxlZCB0byBlbmFibGUgZGV2aWNlXG4iKTsKPiArCQlnb3RvIGVycjsK
PiArCX0KPiArCj4gKwlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApIHwgQklU
KDIpIHwgQklUKDQpLAo+ICsJCQkJIElGQ1ZGX0RSSVZFUl9OQU1FKTsKPiArCWlmIChyZXQpIHsK
PiArCQlJRkNWRl9FUlIocGRldiwgIkZhaWxlZCB0byByZXF1ZXN0IE1NSU8gcmVnaW9uXG4iKTsK
PiArCQlnb3RvIGVycjsKPiArCX0KPiArCj4gKwlyZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVy
ZW50KGRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJSUZDVkZfRVJS
KHBkZXYsICJObyB1c2FibGUgRE1BIGNvbmZpZ3VyYXRpb25cbiIpOwo+ICsJCWdvdG8gZXJyOwo+
ICsJfQo+ICsKPiArCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGlmY3ZmX2Zy
ZWVfaXJxX3ZlY3RvcnMsIHBkZXYpOwo+ICsJaWYgKHJldCkgewo+ICsJCUlGQ1ZGX0VSUihwZGV2
LAo+ICsJCQkgICJGYWlsZWQgZm9yIGFkZGluZyBkZXZyZXMgZm9yIGZyZWVpbmcgaXJxIHZlY3Rv
cnNcbiIpOwo+ICsJCWdvdG8gZXJyOwo+ICsJfQo+ICsKPiArCXBjaV9zZXRfbWFzdGVyKHBkZXYp
Owo+ICsKPiArCXJldCA9IHZkcGFfbWdtdGRldl9yZWdpc3RlcigmaWZjdmZfbWdtdF9kZXYtPm1k
ZXYpOwo+ICsJaWYgKHJldCkgewo+ICsJCUlGQ1ZGX0VSUihwZGV2LAo+ICsJCQkgICJGYWlsZWQg
dG8gaW5pdGlhbGl6ZSB0aGUgbWFuYWdlbWVudCBpbnRlcmZhY2VzXG4iKTsKPiArCQlnb3RvIGVy
cjsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArCj4gK2VycjoKPiArCWtmcmVlKGlmY3ZmX21n
bXRfZGV2KTsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gICBzdGF0aWMgdm9pZCBpZmN2Zl9y
ZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gICB7Cj4gLQlzdHJ1Y3QgaWZjdmZfYWRhcHRl
ciAqYWRhcHRlciA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArCXN0cnVjdCBpZmN2Zl92ZHBh
X21nbXRfZGV2ICppZmN2Zl9tZ210X2RldjsKPiAgIAo+IC0JdmRwYV91bnJlZ2lzdGVyX2Rldmlj
ZSgmYWRhcHRlci0+dmRwYSk7Cj4gKwlpZmN2Zl9tZ210X2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShw
ZGV2KTsKPiArCXZkcGFfbWdtdGRldl91bnJlZ2lzdGVyKCZpZmN2Zl9tZ210X2Rldi0+bWRldik7
Cj4gKwlrZnJlZShpZmN2Zl9tZ210X2Rldik7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBzdHJ1Y3Qg
cGNpX2RldmljZV9pZCBpZmN2Zl9wY2lfaWRzW10gPSB7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
