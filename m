Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04F1290E6
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 03:27:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB8A68634E;
	Mon, 23 Dec 2019 02:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmuEQY0fHlMZ; Mon, 23 Dec 2019 02:27:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17DA08610A;
	Mon, 23 Dec 2019 02:27:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBBD1C0881;
	Mon, 23 Dec 2019 02:27:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D44D1C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CE51B20364
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTQEyJEFqWLS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:27:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 8B9951FEED
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577068037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kD35sfP6XKEEp3IXzrqtx7kmvVsLvnQz0I50VQIYW8o=;
 b=YSD+j9oapZK1g+yh/uUHkwIjNNRN4sofmIZ1j+r3rrC9+18LS6ULwk7bQQAEfEc1joP68M
 LSBOLruGNYF7U+7aCeDUFFtWxFkQ/KzArpcSaNylL3V2d5n+VfJjiwlojormywKh40V+NR
 UHsXbQNEouie6XHM6Zg60+XxO+gCfjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-y2kGU1S9PtC6_YSyJi2uXQ-1; Sun, 22 Dec 2019 21:27:15 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80335107ACC4;
 Mon, 23 Dec 2019 02:27:14 +0000 (UTC)
Received: from [10.72.13.6] (ovpn-13-6.pek2.redhat.com [10.72.13.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EF57271A6;
 Mon, 23 Dec 2019 02:27:05 +0000 (UTC)
Subject: Re: [RHEL7]virtio-net: switch to use XPS to choose txq
To: Cindylu <lulu@redhat.com>, virtualization@lists.linux-foundation.org,
 mst@redhat.com, jfreimann@redhat.com, rusty@rustcorp.com.au,
 jmaxwell@redhat.com
References: <20191220114813.7052-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bef78003-144d-ccb7-79a6-f16d6cccdad8@redhat.com>
Date: Mon, 23 Dec 2019 10:27:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191220114813.7052-1-lulu@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: y2kGU1S9PtC6_YSyJi2uXQ-1
X-Mimecast-Spam-Score: 0
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

Ck9uIDIwMTkvMTIvMjAg5LiL5Y2INzo0OCwgQ2luZHlsdSB3cm90ZToKPiBCdWd6aWxsYTogaHR0
cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzY5NDc5Cj4gVXBzdHJl
YW0gU3RhdHVzOiA5YmI4Y2E4NjA3NWYzN2QzYzE2OWI5YzQ2ZjhlN2M2ZDMxNjVlMThmCj4gQnJl
dzogwqBodHRwczovL2JyZXd3ZWIuZGV2ZWwucmVkaGF0LmNvbS90YXNraW5mbz90YXNrSUQ9MjU0
ODIwNTAKPiBUZXN0ZWQ6IHZlcmlmaWVkIGJ5IGN1c3RvbWVyCj4KPiBjb21taXQgOWJiOGNhODYw
NzVmMzdkM2MxNjliOWM0NmY4ZTdjNmQzMTY1ZTE4Zgo+IEF1dGhvcjogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4KPiBEYXRlOiAgIFR1ZSBOb3YgNSAxODoxOTo0NSAyMDEzICswODAw
Cj4KPiAgICAgIHZpcnRpby1uZXQ6IHN3aXRjaCB0byB1c2UgWFBTIHRvIGNob29zZSB0eHEKPgo+
ICAgICAgV2UgdXNlZCB0byB1c2UgYSBwZXJjcHUgc3RydWN0dXJlIHZxX2luZGV4IHRvIHJlY29y
ZCB0aGUgY3B1IHRvIHF1ZXVlCj4gICAgICBtYXBwaW5nLCB0aGlzIGlzIHN1Ym9wdGltYWwgc2lu
Y2UgaXQgZHVwbGljYXRlcyB0aGUgd29yayBvZiBYUFMgYW5kCj4gICAgICBsb3NlcyBhbGwgb3Ro
ZXIgWFBTIGZ1bmN0aW9uYWxpdHkgc3VjaCBhcyBhbGxvd2luZyB1c2VyIHRvIGNvbmZpZ3VyZQo+
ICAgICAgdGhlaXIgb3duIHRyYW5zbWlzc2lvbiBzdGVlcmluZyBzdHJhdGVneS4KPgo+ICAgICAg
U28gdGhpcyBwYXRjaCBzd2l0Y2hlcyB0byB1c2UgWFBTIGFuZCBzdWdnZXN0IGEgZGVmYXVsdCBt
YXBwaW5nIHdoZW4KPiAgICAgIHRoZSBudW1iZXIgb2YgY3B1cyBpcyBlcXVhbCB0byB0aGUgbnVt
YmVyIG9mIHF1ZXVlcy4gV2l0aCBYUFMgc3VwcG9ydCwKPiAgICAgIHRoZXJlJ3Mgbm8gbmVlZCBm
b3Iga2VlcGluZyBwZXItY3B1IHZxX2luZGV4IGFuZCAubmRvX3NlbGVjdF9xdWV1ZSgpLAo+ICAg
ICAgc28gdGhleSB3ZXJlIHJlbW92ZWQgYWxzby4KPgo+ICAgICAgQ2M6IFJ1c3R5IFJ1c3NlbGwg
PHJ1c3R5QHJ1c3Rjb3JwLmNvbS5hdT4KPiAgICAgIENjOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPgo+ICAgICAgQWNrZWQtYnk6IFJ1c3R5IFJ1c3NlbGwgPHJ1c3R5QHJ1c3Rj
b3JwLmNvbS5hdT4KPiAgICAgIEFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRo
YXQuY29tPgo+ICAgICAgU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4KPiAgICAgIFNpZ25lZC1vZmYtYnk6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1s
b2Z0Lm5ldD4KPiAtLS0KPiAgIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8IDQ5ICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3ZpcnRpb19uZXQuYyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+IGluZGV4IDYxYzY0ZDky
MjExLi5kNTMzNTc3NGM2MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMK
PiArKysgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiBAQCAtMTI1LDkgKzEyNSw2IEBAIHN0
cnVjdCB2aXJ0bmV0X2luZm8gewo+ICAgCS8qIERvZXMgdGhlIGFmZmluaXR5IGhpbnQgaXMgc2V0
IGZvciB2aXJ0cXVldWVzPyAqLwo+ICAgCWJvb2wgYWZmaW5pdHlfaGludF9zZXQ7Cj4gICAKPiAt
CS8qIFBlci1jcHUgdmFyaWFibGUgdG8gc2hvdyB0aGUgbWFwcGluZyBmcm9tIENQVSB0byB2aXJ0
cXVldWUgKi8KPiAtCWludCBfX3BlcmNwdSAqdnFfaW5kZXg7Cj4gLQo+ICAgCS8qIENQVSBob3Qg
cGx1ZyBub3RpZmllciAqLwo+ICAgCXN0cnVjdCBub3RpZmllcl9ibG9jayBuYjsKPiAgIAo+IEBA
IC0xMTI0LDcgKzExMjEsNiBAQCBzdGF0aWMgaW50IHZpcnRuZXRfdmxhbl9yeF9raWxsX3ZpZChz
dHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ICAgc3RhdGljIHZvaWQgdmlydG5ldF9jbGVhbl9hZmZp
bml0eShzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwgbG9uZyBoY3B1KQo+ICAgewo+ICAgCWludCBp
Owo+IC0JaW50IGNwdTsKPiAgIAo+ICAgCWlmICh2aS0+YWZmaW5pdHlfaGludF9zZXQpIHsKPiAg
IAkJZm9yIChpID0gMDsgaSA8IHZpLT5tYXhfcXVldWVfcGFpcnM7IGkrKykgewo+IEBAIC0xMTM0
LDE2ICsxMTMwLDYgQEAgc3RhdGljIHZvaWQgdmlydG5ldF9jbGVhbl9hZmZpbml0eShzdHJ1Y3Qg
dmlydG5ldF9pbmZvICp2aSwgbG9uZyBoY3B1KQo+ICAgCj4gICAJCXZpLT5hZmZpbml0eV9oaW50
X3NldCA9IGZhbHNlOwo+ICAgCX0KPiAtCj4gLQlpID0gMDsKPiAtCWZvcl9lYWNoX29ubGluZV9j
cHUoY3B1KSB7Cj4gLQkJaWYgKGNwdSA9PSBoY3B1KSB7Cj4gLQkJCSpwZXJfY3B1X3B0cih2aS0+
dnFfaW5kZXgsIGNwdSkgPSAtMTsKPiAtCQl9IGVsc2Ugewo+IC0JCQkqcGVyX2NwdV9wdHIodmkt
PnZxX2luZGV4LCBjcHUpID0KPiAtCQkJCSsraSAlIHZpLT5jdXJyX3F1ZXVlX3BhaXJzOwo+IC0J
CX0KPiAtCX0KPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgdmlydG5ldF9zZXRfYWZmaW5pdHko
c3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gQEAgLTExNjUsNyArMTE1MSw3IEBAIHN0YXRpYyB2
b2lkIHZpcnRuZXRfc2V0X2FmZmluaXR5KHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpKQo+ICAgCWZv
cl9lYWNoX29ubGluZV9jcHUoY3B1KSB7Cj4gICAJCXZpcnRxdWV1ZV9zZXRfYWZmaW5pdHkodmkt
PnJxW2ldLnZxLCBjcHUpOwo+ICAgCQl2aXJ0cXVldWVfc2V0X2FmZmluaXR5KHZpLT5zcVtpXS52
cSwgY3B1KTsKPiAtCQkqcGVyX2NwdV9wdHIodmktPnZxX2luZGV4LCBjcHUpID0gaTsKPiArCQlu
ZXRpZl9zZXRfeHBzX3F1ZXVlKHZpLT5kZXYsIGNwdW1hc2tfb2YoY3B1KSwgaSk7Cj4gICAJCWkr
KzsKPiAgIAl9Cj4gICAKPiBAQCAtMTI2OCwyOSArMTI1NCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZXRodG9vbF9vcHMgdmlydG5ldF9ldGh0b29sX29wcyA9IHsKPiAgIAkuZ2V0X2NoYW5uZWxz
ID0gdmlydG5ldF9nZXRfY2hhbm5lbHMsCj4gICB9Owo+ICAgCj4gLS8qIFRvIGF2b2lkIGNvbnRl
bmRpbmcgYSBsb2NrIGhvbGQgYnkgYSB2Y3B1IHdobyB3b3VsZCBleGl0IHRvIGhvc3QsIHNlbGVj
dCB0aGUKPiAtICogdHhxIGJhc2VkIG9uIHRoZSBwcm9jZXNzb3IgaWQuCj4gLSAqLwo+IC1zdGF0
aWMgdTE2IHZpcnRuZXRfc2VsZWN0X3F1ZXVlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVj
dCBza19idWZmICpza2IsCj4gLQkJCXZvaWQgKmFjY2VsX3ByaXYsIHNlbGVjdF9xdWV1ZV9mYWxs
YmFja190IGZhbGxiYWNrKQo+IC17Cj4gLQlpbnQgdHhxOwo+IC0Jc3RydWN0IHZpcnRuZXRfaW5m
byAqdmkgPSBuZXRkZXZfcHJpdihkZXYpOwo+IC0KPiAtCWlmIChza2JfcnhfcXVldWVfcmVjb3Jk
ZWQoc2tiKSkgewo+IC0JCXR4cSA9IHNrYl9nZXRfcnhfcXVldWUoc2tiKTsKPiAtCX0gZWxzZSB7
Cj4gLQkJdHhxID0gKl9fdGhpc19jcHVfcHRyKHZpLT52cV9pbmRleCk7Cj4gLQkJaWYgKHR4cSA9
PSAtMSkKPiAtCQkJdHhxID0gMDsKPiAtCX0KPiAtCj4gLQl3aGlsZSAodW5saWtlbHkodHhxID49
IGRldi0+cmVhbF9udW1fdHhfcXVldWVzKSkKPiAtCQl0eHEgLT0gZGV2LT5yZWFsX251bV90eF9x
dWV1ZXM7Cj4gLQo+IC0JcmV0dXJuIHR4cTsKPiAtfQo+IC0KPiAgIHN0YXRpYyBpbnQgdmlydG5l
dF9nZXRfcGh5c19wb3J0X25hbWUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgY2hhciAqYnVmLAo+
ICAgCQkJCSAgICAgIHNpemVfdCBsZW4pCj4gICB7Cj4gQEAgLTEzMTcsNyArMTI4MCw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbmV0X2RldmljZV9vcHMgdmlydG5ldF9uZXRkZXYgPSB7Cj4gICAJ
Lm5kb19nZXRfc3RhdHM2NCAgICAgPSB2aXJ0bmV0X3N0YXRzLAo+ICAgCS5uZG9fdmxhbl9yeF9h
ZGRfdmlkID0gdmlydG5ldF92bGFuX3J4X2FkZF92aWQsCj4gICAJLm5kb192bGFuX3J4X2tpbGxf
dmlkID0gdmlydG5ldF92bGFuX3J4X2tpbGxfdmlkLAo+IC0JLm5kb19zZWxlY3RfcXVldWUgICAg
ID0gdmlydG5ldF9zZWxlY3RfcXVldWUsCj4gICAjaWZkZWYgQ09ORklHX05FVF9QT0xMX0NPTlRS
T0xMRVIKPiAgIAkubmRvX3BvbGxfY29udHJvbGxlciA9IHZpcnRuZXRfbmV0cG9sbCwKPiAgICNl
bmRpZgo+IEBAIC0xNjQyLDEwICsxNjA0LDYgQEAgc3RhdGljIGludCB2aXJ0bmV0X3Byb2JlKHN0
cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICAgCWlmICh2aS0+c3RhdHMgPT0gTlVMTCkKPiAg
IAkJZ290byBmcmVlOwo+ICAgCj4gLQl2aS0+dnFfaW5kZXggPSBhbGxvY19wZXJjcHUoaW50KTsK
PiAtCWlmICh2aS0+dnFfaW5kZXggPT0gTlVMTCkKPiAtCQlnb3RvIGZyZWVfc3RhdHM7Cj4gLQo+
ICAgCUlOSVRfV09SSygmdmktPmNvbmZpZ193b3JrLCB2aXJ0bmV0X2NvbmZpZ19jaGFuZ2VkX3dv
cmspOwo+ICAgCj4gICAJLyogSWYgd2UgY2FuIHJlY2VpdmUgQU5ZIEdTTyBwYWNrZXRzLCB3ZSBt
dXN0IGFsbG9jYXRlIGxhcmdlIG9uZXMuICovCj4gQEAgLTE2OTUsNyArMTY1Myw3IEBAIHN0YXRp
YyBpbnQgdmlydG5ldF9wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgIAkvKiBB
bGxvY2F0ZS9pbml0aWFsaXplIHRoZSByeC90eCBxdWV1ZXMsIGFuZCBpbnZva2UgZmluZF92cXMg
Ki8KPiAgIAllcnIgPSBpbml0X3Zxcyh2aSk7Cj4gICAJaWYgKGVycikKPiAtCQlnb3RvIGZyZWVf
aW5kZXg7Cj4gKwkJZ290byBmcmVlX3N0YXRzOwo+ICAgCj4gICAJbmV0aWZfc2V0X3JlYWxfbnVt
X3R4X3F1ZXVlcyhkZXYsIHZpLT5jdXJyX3F1ZXVlX3BhaXJzKTsKPiAgIAluZXRpZl9zZXRfcmVh
bF9udW1fcnhfcXVldWVzKGRldiwgdmktPmN1cnJfcXVldWVfcGFpcnMpOwo+IEBAIC0xNzY0LDgg
KzE3MjIsNiBAQCBmcmVlX2ZhaWxvdmVyOgo+ICAgZnJlZV92cXM6Cj4gICAJY2FuY2VsX2RlbGF5
ZWRfd29ya19zeW5jKCZ2aS0+cmVmaWxsKTsKPiAgIAl2aXJ0bmV0X2RlbF92cXModmkpOwo+IC1m
cmVlX2luZGV4Ogo+IC0JZnJlZV9wZXJjcHUodmktPnZxX2luZGV4KTsKPiAgIGZyZWVfc3RhdHM6
Cj4gICAJZnJlZV9wZXJjcHUodmktPnN0YXRzKTsKPiAgIGZyZWU6Cj4gQEAgLTE4MDEsNyArMTc1
Nyw2IEBAIHN0YXRpYyB2b2lkIHZpcnRuZXRfcmVtb3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2
ZGV2KQo+ICAgCXJlbW92ZV92cV9jb21tb24odmkpOwo+ICAgCj4gICAKPiAtCWZyZWVfcGVyY3B1
KHZpLT52cV9pbmRleCk7Cj4gICAJZnJlZV9wZXJjcHUodmktPnN0YXRzKTsKPiAgIAlmcmVlX25l
dGRldih2aS0+ZGV2KTsKPiAgIH0KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
