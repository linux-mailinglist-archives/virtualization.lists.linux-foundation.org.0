Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D52231B3
	for <lists.virtualization@lfdr.de>; Fri, 17 Jul 2020 05:32:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF5F58789A;
	Fri, 17 Jul 2020 03:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCwcIC0rbEZM; Fri, 17 Jul 2020 03:32:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 179C68789F;
	Fri, 17 Jul 2020 03:32:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDF4FC08A9;
	Fri, 17 Jul 2020 03:32:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AE36C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 03:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6E49887897
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 03:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a5F7BURvVll
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 03:32:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1BFD787894
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 03:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594956751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6T/hdsKA4gVeLb5zmHKTsZJah3hEDlOSvih8w3wco3Y=;
 b=W3FKsAWFAQEA+dIAWWZ8ic+cpf17rYiMxgaLrWgzPBwUjTwqnyl0ZDuAJWwutr7vHkI5hy
 bEQbF05vErDxXG5VwJLHQ9jinyhHJeaeCbsqOKdKBLzAFh7v8WpMLLiQzuUf7mSJK1aFBe
 7j3wdFOhrS5ibh5exgMV2k3magpQPaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-TgXkhmXkNImcuP1mthYH7w-1; Thu, 16 Jul 2020 23:32:29 -0400
X-MC-Unique: TgXkhmXkNImcuP1mthYH7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0CD1107ACCA;
 Fri, 17 Jul 2020 03:32:27 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A23F74F64;
 Fri, 17 Jul 2020 03:32:11 +0000 (UTC)
Subject: Re: [PATCH V2 1/6] vhost: introduce vhost_call_ctx
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-2-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <871ee1c1-8cf7-3d9d-1892-5991b92e5db3@redhat.com>
Date: Fri, 17 Jul 2020 11:32:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594898629-18790-2-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNy8xNiDkuIvljYg3OjIzLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW50cm9kdWNlcyBzdHJ1Y3Qgdmhvc3RfY2FsbF9jdHggd2hpY2ggcmVwbGFjZWQKPiByYXcg
c3RydWN0IGV2ZW50ZmRfY3R4ICpjYWxsX2N0eCBpbiBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlLgo+
IEJlc2lkZXMgZXZlbnRmZF9jdHgsIGl0IGNvbnRhaW5zIGEgc3BpbiBsb2NrIGFuZCBhbgo+IGly
cV9ieXBhc3NfcHJvZHVjZXIgaW4gaXRzIHN0cnVjdHVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFpo
dSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEu
YyAgfCAgNCArKy0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyMiArKysrKysrKysrKysr
KysrLS0tLS0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgOSArKysrKysrKy0KPiAgIDMg
ZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gaW5k
ZXggNzU4MGUzNC4uMmZjYzQyMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+
ICsrKyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gQEAgLTk2LDcgKzk2LDcgQEAgc3RhdGljIHZv
aWQgaGFuZGxlX3ZxX2tpY2soc3RydWN0IHZob3N0X3dvcmsgKndvcmspCj4gICBzdGF0aWMgaXJx
cmV0dXJuX3Qgdmhvc3RfdmRwYV92aXJ0cXVldWVfY2Iodm9pZCAqcHJpdmF0ZSkKPiAgIHsKPiAg
IAlzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSA9IHByaXZhdGU7Cj4gLQlzdHJ1Y3QgZXZlbnRm
ZF9jdHggKmNhbGxfY3R4ID0gdnEtPmNhbGxfY3R4Owo+ICsJc3RydWN0IGV2ZW50ZmRfY3R4ICpj
YWxsX2N0eCA9IHZxLT5jYWxsX2N0eC5jdHg7Cj4gICAKPiAgIAlpZiAoY2FsbF9jdHgpCj4gICAJ
CWV2ZW50ZmRfc2lnbmFsKGNhbGxfY3R4LCAxKTsKPiBAQCAtMzgyLDcgKzM4Miw3IEBAIHN0YXRp
YyBsb25nIHZob3N0X3ZkcGFfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHVuc2ln
bmVkIGludCBjbWQsCj4gICAJCWJyZWFrOwo+ICAgCj4gICAJY2FzZSBWSE9TVF9TRVRfVlJJTkdf
Q0FMTDoKPiAtCQlpZiAodnEtPmNhbGxfY3R4KSB7Cj4gKwkJaWYgKHZxLT5jYWxsX2N0eC5jdHgp
IHsKPiAgIAkJCWNiLmNhbGxiYWNrID0gdmhvc3RfdmRwYV92aXJ0cXVldWVfY2I7Cj4gICAJCQlj
Yi5wcml2YXRlID0gdnE7Cj4gICAJCX0gZWxzZSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IGluZGV4IGQ3YjhkZjMuLjQwMDRl
OTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gKysrIGIvZHJpdmVycy92
aG9zdC92aG9zdC5jCj4gQEAgLTI5OCw2ICsyOTgsMTMgQEAgc3RhdGljIHZvaWQgdmhvc3RfdnFf
bWV0YV9yZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpkKQo+ICAgCQlfX3Zob3N0X3ZxX21ldGFfcmVz
ZXQoZC0+dnFzW2ldKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCB2aG9zdF9jYWxsX2N0eF9y
ZXNldChzdHJ1Y3Qgdmhvc3RfY2FsbF9jdHggKmNhbGxfY3R4KQo+ICt7Cj4gKwljYWxsX2N0eC0+
Y3R4ID0gTlVMTDsKPiArCW1lbXNldCgmY2FsbF9jdHgtPnByb2R1Y2VyLCAweDAsIHNpemVvZihz
dHJ1Y3QgaXJxX2J5cGFzc19wcm9kdWNlcikpOwo+ICsJc3Bpbl9sb2NrX2luaXQoJmNhbGxfY3R4
LT5jdHhfbG9jayk7Cj4gK30KPiArCj4gICBzdGF0aWMgdm9pZCB2aG9zdF92cV9yZXNldChzdHJ1
Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gICAJCQkgICBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkK
PiAgIHsKPiBAQCAtMzE5LDEzICszMjYsMTMgQEAgc3RhdGljIHZvaWQgdmhvc3RfdnFfcmVzZXQo
c3RydWN0IHZob3N0X2RldiAqZGV2LAo+ICAgCXZxLT5sb2dfYmFzZSA9IE5VTEw7Cj4gICAJdnEt
PmVycm9yX2N0eCA9IE5VTEw7Cj4gICAJdnEtPmtpY2sgPSBOVUxMOwo+IC0JdnEtPmNhbGxfY3R4
ID0gTlVMTDsKPiAgIAl2cS0+bG9nX2N0eCA9IE5VTEw7Cj4gICAJdmhvc3RfcmVzZXRfaXNfbGUo
dnEpOwo+ICAgCXZob3N0X2Rpc2FibGVfY3Jvc3NfZW5kaWFuKHZxKTsKPiAgIAl2cS0+YnVzeWxv
b3BfdGltZW91dCA9IDA7Cj4gICAJdnEtPnVtZW0gPSBOVUxMOwo+ICAgCXZxLT5pb3RsYiA9IE5V
TEw7Cj4gKwl2aG9zdF9jYWxsX2N0eF9yZXNldCgmdnEtPmNhbGxfY3R4KTsKPiAgIAlfX3Zob3N0
X3ZxX21ldGFfcmVzZXQodnEpOwo+ICAgfQo+ICAgCj4gQEAgLTY4NSw4ICs2OTIsOCBAQCB2b2lk
IHZob3N0X2Rldl9jbGVhbnVwKHN0cnVjdCB2aG9zdF9kZXYgKmRldikKPiAgIAkJCWV2ZW50ZmRf
Y3R4X3B1dChkZXYtPnZxc1tpXS0+ZXJyb3JfY3R4KTsKPiAgIAkJaWYgKGRldi0+dnFzW2ldLT5r
aWNrKQo+ICAgCQkJZnB1dChkZXYtPnZxc1tpXS0+a2ljayk7Cj4gLQkJaWYgKGRldi0+dnFzW2ld
LT5jYWxsX2N0eCkKPiAtCQkJZXZlbnRmZF9jdHhfcHV0KGRldi0+dnFzW2ldLT5jYWxsX2N0eCk7
Cj4gKwkJaWYgKGRldi0+dnFzW2ldLT5jYWxsX2N0eC5jdHgpCj4gKwkJCWV2ZW50ZmRfY3R4X3B1
dChkZXYtPnZxc1tpXS0+Y2FsbF9jdHguY3R4KTsKPiAgIAkJdmhvc3RfdnFfcmVzZXQoZGV2LCBk
ZXYtPnZxc1tpXSk7Cj4gICAJfQo+ICAgCXZob3N0X2Rldl9mcmVlX2lvdmVjcyhkZXYpOwo+IEBA
IC0xNjI5LDcgKzE2MzYsMTAgQEAgbG9uZyB2aG9zdF92cmluZ19pb2N0bChzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpkLCB1bnNpZ25lZCBpbnQgaW9jdGwsIHZvaWQgX191c2VyICphcmcKPiAgIAkJCXIgPSBQ
VFJfRVJSKGN0eCk7Cj4gICAJCQlicmVhazsKPiAgIAkJfQo+IC0JCXN3YXAoY3R4LCB2cS0+Y2Fs
bF9jdHgpOwo+ICsKPiArCQlzcGluX2xvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9jayk7Cj4gKwkJ
c3dhcChjdHgsIHZxLT5jYWxsX2N0eC5jdHgpOwo+ICsJCXNwaW5fdW5sb2NrKCZ2cS0+Y2FsbF9j
dHguY3R4X2xvY2spOwo+ICAgCQlicmVhazsKPiAgIAljYXNlIFZIT1NUX1NFVF9WUklOR19FUlI6
Cj4gICAJCWlmIChjb3B5X2Zyb21fdXNlcigmZiwgYXJncCwgc2l6ZW9mIGYpKSB7Cj4gQEAgLTI0
NDAsOCArMjQ1MCw4IEBAIHN0YXRpYyBib29sIHZob3N0X25vdGlmeShzdHJ1Y3Qgdmhvc3RfZGV2
ICpkZXYsIHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ICAgdm9pZCB2aG9zdF9zaWduYWwo
c3RydWN0IHZob3N0X2RldiAqZGV2LCBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiAgIHsK
PiAgIAkvKiBTaWduYWwgdGhlIEd1ZXN0IHRlbGwgdGhlbSB3ZSB1c2VkIHNvbWV0aGluZyB1cC4g
Ki8KPiAtCWlmICh2cS0+Y2FsbF9jdHggJiYgdmhvc3Rfbm90aWZ5KGRldiwgdnEpKQo+IC0JCWV2
ZW50ZmRfc2lnbmFsKHZxLT5jYWxsX2N0eCwgMSk7Cj4gKwlpZiAodnEtPmNhbGxfY3R4LmN0eCAm
JiB2aG9zdF9ub3RpZnkoZGV2LCB2cSkpCj4gKwkJZXZlbnRmZF9zaWduYWwodnEtPmNhbGxfY3R4
LmN0eCwgMSk7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MX0dQTCh2aG9zdF9zaWduYWwpOwo+ICAg
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhvc3Qvdmhv
c3QuaAo+IGluZGV4IGM4ZTk2YTAuLjQwMmM2MmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9z
dC92aG9zdC5oCj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gQEAgLTEzLDYgKzEzLDcg
QEAKPiAgICNpbmNsdWRlIDxsaW51eC92aXJ0aW9fcmluZy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L2F0b21pYy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lvdGxiLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9pcnFieXBhc3MuaD4KPiAgIAo+ICAgc3RydWN0IHZob3N0X3dvcms7Cj4gICB0eXBl
ZGVmIHZvaWQgKCp2aG9zdF93b3JrX2ZuX3QpKHN0cnVjdCB2aG9zdF93b3JrICp3b3JrKTsKPiBA
QCAtNjAsNiArNjEsMTIgQEAgZW51bSB2aG9zdF91YWRkcl90eXBlIHsKPiAgIAlWSE9TVF9OVU1f
QUREUlMgPSAzLAo+ICAgfTsKPiAgIAo+ICtzdHJ1Y3Qgdmhvc3RfY2FsbF9jdHggewoKCkkgdGhp
bmsgbWF5YmUgInZob3N0X3ZyaW5nX2NhbGwiIGlzIGEgYmV0dGVyIG5hbWUgc2luY2UgaXQgY29u
dGFpbnMgbm90IApvbmx5IHRoZSBldmVudGZkX2N0eCBub3cuCgpUaGFua3MKCgo+ICsJc3RydWN0
IGV2ZW50ZmRfY3R4ICpjdHg7Cj4gKwlzdHJ1Y3QgaXJxX2J5cGFzc19wcm9kdWNlciBwcm9kdWNl
cjsKPiArCXNwaW5sb2NrX3QgY3R4X2xvY2s7Cj4gK307Cj4gKwo+ICAgLyogVGhlIHZpcnRxdWV1
ZSBzdHJ1Y3R1cmUgZGVzY3JpYmVzIGEgcXVldWUgYXR0YWNoZWQgdG8gYSBkZXZpY2UuICovCj4g
ICBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlIHsKPiAgIAlzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXY7Cj4g
QEAgLTcyLDcgKzc5LDcgQEAgc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSB7Cj4gICAJdnJpbmdfdXNl
ZF90IF9fdXNlciAqdXNlZDsKPiAgIAljb25zdCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbWFwICptZXRh
X2lvdGxiW1ZIT1NUX05VTV9BRERSU107Cj4gICAJc3RydWN0IGZpbGUgKmtpY2s7Cj4gLQlzdHJ1
Y3QgZXZlbnRmZF9jdHggKmNhbGxfY3R4Owo+ICsJc3RydWN0IHZob3N0X2NhbGxfY3R4IGNhbGxf
Y3R4Owo+ICAgCXN0cnVjdCBldmVudGZkX2N0eCAqZXJyb3JfY3R4Owo+ICAgCXN0cnVjdCBldmVu
dGZkX2N0eCAqbG9nX2N0eDsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
