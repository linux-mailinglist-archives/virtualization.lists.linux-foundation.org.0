Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85B1E5CAD
	for <lists.virtualization@lfdr.de>; Thu, 28 May 2020 12:06:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D460E253E7;
	Thu, 28 May 2020 10:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQriWtVKlfvk; Thu, 28 May 2020 10:06:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 06BE42079D;
	Thu, 28 May 2020 10:06:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1F7EC016F;
	Thu, 28 May 2020 10:06:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE37CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 10:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C27C287E89
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 10:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIkIk4n-GdrM
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 10:06:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 906EE8064E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590660390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnVLq9gOlF/Y0CKh5mHb/8VGvnVEAONI1W/k6ECLs88=;
 b=F1a1vwragr2LVITPmyICnhalfnvk0X+NH5P8J+R1pvsBZL6bTGhFYt+2znR5Efhe8yUwh9
 4qMZkBSZo4Fu9gWVxxHPmjJPUlAuUtViAoK98rT9Ztxt6WRYfgFDdRBQkJ1xDJ9cMg2JGi
 P2yMz+VtTd0EV8BwojNq0mE3l4sIAQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-USNhnFjkO8quSonUUamdyQ-1; Thu, 28 May 2020 06:06:24 -0400
X-MC-Unique: USNhnFjkO8quSonUUamdyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AEE9107ACF2;
 Thu, 28 May 2020 10:06:23 +0000 (UTC)
Received: from [10.72.13.125] (ovpn-13-125.pek2.redhat.com [10.72.13.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2804E5D9F3;
 Thu, 28 May 2020 10:06:16 +0000 (UTC)
Subject: Re: [PATCH] vdpa: bypass waking up vhost_woker for vdpa vq kick
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1590471145-4436-1-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a21bf980-c001-4728-0f08-69494f31fe98@redhat.com>
Date: Thu, 28 May 2020 18:06:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590471145-4436-1-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNS8yNiDkuIvljYgxOjMyLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gU3RhbmRhcmQg
dmhvc3QgZGV2aWNlcyByZWx5IG9uIHdha2luZyB1cCBhIHZob3N0X3dvcmtlciB0byBraWNrCj4g
YSB2aXJ0cXVxdWUuIEhvd2V2ZXIgdmRwYSBkZXZpY2VzIGhhdmUgaGFyZHdhcmUgYmFja2VuZHMs
IHNvIGl0Cj4gZG9lcyBub3QgbmVlZCB0aGlzIHdha2luZyB1cCByb3V0aW4uIEluIHRoaXMgY29t
bWl0LCB2ZHBhIGRldmljZQo+IHdpbGwga2ljayBhIHZpcnRxdWV1ZSBkaXJlY3RseSwgcmVkdWNl
IHRoZSBwZXJmb3JtYW5jZSBvdmVyaGVhZAo+IGNhdXNlZCBieSB3YWtpbmcgdXAgYSB2aG9zdF93
b2tlci4KCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSXQgd291bGQgYmUgaGVscGZ1bCBpZiB5b3Ug
Y2FuIHNoYXJlIHNvbWUgCnBlcmZvcm1hbmNlIG51bWJlcnMuCgpBbmQgdGhlIHRpdGxlIHNob3Vs
ZCBiZSAidmhvc3QtdmRwYToiIGluc3RlYWQgb2YgInZkcGE6IgoKVGhpcyBwYXRjaCBpcyBpbXBv
cnRhbnQgc2luY2Ugd2Ugd2FudCB0byBnZXQgcmlkIG9mIGt0cmhlYWQgYW5kIAp1c2VfbW0oKS91
bnVzZV9tbSgpIHN0dWZmcyB3aGljaCBhbGxvd3MgdXMgdG8gaW1wbGVtZW50IGRvb3JiZWxsIG1h
cHBpbmcuCgoKPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGlu
dGVsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyB8IDEwMCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMDAg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jIGIvZHJp
dmVycy92aG9zdC92ZHBhLmMKPiBpbmRleCAwOTY4MzYxLi5kM2EyYWNhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gKysrIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBAQCAt
Mjg3LDYgKzI4Nyw2NiBAQCBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX2dldF92cmluZ19udW0oc3Ry
dWN0IHZob3N0X3ZkcGEgKnYsIHUxNiBfX3VzZXIgKmFyZ3ApCj4gICAKPiAgIAlyZXR1cm4gMDsK
PiAgIH0KPiArdm9pZCB2aG9zdF92ZHBhX3BvbGxfc3RvcChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVl
ICp2cSkKPiArewo+ICsJdmhvc3RfcG9sbF9zdG9wKCZ2cS0+cG9sbCk7Cj4gK30KPiArCj4gK2lu
dCB2aG9zdF92ZHBhX3BvbGxfc3RhcnQoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gK3sK
PiArCXN0cnVjdCB2aG9zdF9wb2xsICpwb2xsID0gJnZxLT5wb2xsOwo+ICsJc3RydWN0IGZpbGUg
KmZpbGUgPSB2cS0+a2ljazsKPiArCV9fcG9sbF90IG1hc2s7Cj4gKwo+ICsKPiArCWlmIChwb2xs
LT53cWgpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJbWFzayA9IHZmc19wb2xsKGZpbGUsICZwb2xs
LT50YWJsZSk7Cj4gKwlpZiAobWFzaykKPiArCQl2cS0+aGFuZGxlX2tpY2soJnZxLT5wb2xsLndv
cmspOwo+ICsJaWYgKG1hc2sgJiBFUE9MTEVSUikgewo+ICsJCXZob3N0X3BvbGxfc3RvcChwb2xs
KTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKClNv
IHRoaXMgYmFzaWNhbGx5IGEgZHVwbGljYXRpb24gb2Ygdmhvc3RfcG9sbF9zdGFydCgpPwoKCj4g
Kwo+ICtzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX3NldF92cmluZ19raWNrKHN0cnVjdCB2aG9zdF92
aXJ0cXVldWUgKnZxLAo+ICsJCQkJICAgICAgdm9pZCBfX3VzZXIgKmFyZ3ApCj4gK3sKPiArCWJv
b2wgcG9sbHN0YXJ0ID0gZmFsc2UsIHBvbGxzdG9wID0gZmFsc2U7Cj4gKwlzdHJ1Y3QgZmlsZSAq
ZXZlbnRmcCwgKmZpbGVwID0gTlVMTDsKPiArCXN0cnVjdCB2aG9zdF92cmluZ19maWxlIGY7Cj4g
Kwlsb25nIHI7Cj4gKwo+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZmLCBhcmdwLCBzaXplb2YoZikp
KQo+ICsJCXJldHVybiAtRUZBVUxUOwo+ICsKPiArCWV2ZW50ZnAgPSBmLmZkID09IC0xID8gTlVM
TCA6IGV2ZW50ZmRfZmdldChmLmZkKTsKPiArCWlmIChJU19FUlIoZXZlbnRmcCkpIHsKPiArCQly
ID0gUFRSX0VSUihldmVudGZwKTsKPiArCQlyZXR1cm4gcjsKPiArCX0KPiArCj4gKwlpZiAoZXZl
bnRmcCAhPSB2cS0+a2ljaykgewo+ICsJCXBvbGxzdG9wID0gKGZpbGVwID0gdnEtPmtpY2spICE9
IE5VTEw7Cj4gKwkJcG9sbHN0YXJ0ID0gKHZxLT5raWNrID0gZXZlbnRmcCkgIT0gTlVMTDsKPiAr
CX0gZWxzZQo+ICsJCWZpbGVwID0gZXZlbnRmcDsKPiArCj4gKwlpZiAocG9sbHN0b3AgJiYgdnEt
PmhhbmRsZV9raWNrKQo+ICsJCXZob3N0X3ZkcGFfcG9sbF9zdG9wKHZxKTsKPiArCj4gKwlpZiAo
ZmlsZXApCj4gKwkJZnB1dChmaWxlcCk7Cj4gKwo+ICsJaWYgKHBvbGxzdGFydCAmJiB2cS0+aGFu
ZGxlX2tpY2spCj4gKwkJciA9IHZob3N0X3ZkcGFfcG9sbF9zdGFydCh2cSk7Cj4gKwo+ICsJcmV0
dXJuIHI7Cj4gK30KPiAgIAo+ICAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV92cmluZ19pb2N0bChz
dHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdW5zaWduZWQgaW50IGNtZCwKPiAgIAkJCQkgICB2b2lkIF9f
dXNlciAqYXJncCkKPiBAQCAtMzE2LDYgKzM3NiwxMSBAQCBzdGF0aWMgbG9uZyB2aG9zdF92ZHBh
X3ZyaW5nX2lvY3RsKHN0cnVjdCB2aG9zdF92ZHBhICp2LCB1bnNpZ25lZCBpbnQgY21kLAo+ICAg
CQlyZXR1cm4gMDsKPiAgIAl9Cj4gICAKPiArCWlmIChjbWQgPT0gVkhPU1RfU0VUX1ZSSU5HX0tJ
Q0spIHsKPiArCQlyID0gdmhvc3RfdmRwYV9zZXRfdnJpbmdfa2ljayh2cSwgYXJncCk7Cj4gKwkJ
cmV0dXJuIHI7Cj4gKwl9Cj4gKwo+ICAgCWlmIChjbWQgPT0gVkhPU1RfR0VUX1ZSSU5HX0JBU0Up
Cj4gICAJCXZxLT5sYXN0X2F2YWlsX2lkeCA9IG9wcy0+Z2V0X3ZxX3N0YXRlKHYtPnZkcGEsIGlk
eCk7Cj4gICAKPiBAQCAtNjY3LDYgKzczMiwzOSBAQCBzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX2Zy
ZWVfZG9tYWluKHN0cnVjdCB2aG9zdF92ZHBhICp2KQo+ICAgCXYtPmRvbWFpbiA9IE5VTEw7Cj4g
ICB9Cj4gICAKPiArc3RhdGljIGludCB2aG9zdF92ZHBhX3BvbGxfd29ya2VyKHdhaXRfcXVldWVf
ZW50cnlfdCAqd2FpdCwgdW5zaWduZWQgaW50IG1vZGUsCj4gKwkJCQkgIGludCBzeW5jLCB2b2lk
ICprZXkpCj4gK3sKPiArCXN0cnVjdCB2aG9zdF9wb2xsICpwb2xsID0gY29udGFpbmVyX29mKHdh
aXQsIHN0cnVjdCB2aG9zdF9wb2xsLCB3YWl0KTsKPiArCXN0cnVjdCB2aG9zdF92aXJ0cXVldWUg
KnZxID0gY29udGFpbmVyX29mKHBvbGwsIHN0cnVjdCB2aG9zdF92aXJ0cXVldWUsCj4gKwkJCQkJ
CSAgcG9sbCk7Cj4gKwo+ICsJaWYgKCEoa2V5X3RvX3BvbGwoa2V5KSAmIHBvbGwtPm1hc2spKQo+
ICsJCXJldHVybiAwOwo+ICsKPiArCXZxLT5oYW5kbGVfa2ljaygmdnEtPnBvbGwud29yayk7Cj4g
Kwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3ZvaWQgdmhvc3RfdmRwYV9wb2xsX2luaXQoc3Ry
dWN0IHZob3N0X2RldiAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cTsK
PiArCXN0cnVjdCB2aG9zdF9wb2xsICpwb2xsOwo+ICsJaW50IGk7Cj4gKwo+ICsJZm9yIChpID0g
MDsgaSA8IGRldi0+bnZxczsgaSsrKSB7Cj4gKwkJdnEgPSBkZXYtPnZxc1tpXTsKPiArCQlwb2xs
ID0gJnZxLT5wb2xsOwo+ICsJCWlmICh2cS0+aGFuZGxlX2tpY2spIHsKPiArCQkJaW5pdF93YWl0
cXVldWVfZnVuY19lbnRyeSgmcG9sbC0+d2FpdCwKPiArCQkJCQkJICB2aG9zdF92ZHBhX3BvbGxf
d29ya2VyKTsKPiArCQkJcG9sbC0+d29yay5mbiA9IHZxLT5oYW5kbGVfa2ljazsKCgpXaHkgdGhp
cyBpcyBuZWVkZWQ/CgoKPiArCQl9Cj4gKwo+ICsJfQo+ICt9Cj4gKwo+ICAgc3RhdGljIGludCB2
aG9zdF92ZHBhX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQo+
ICAgewo+ICAgCXN0cnVjdCB2aG9zdF92ZHBhICp2Owo+IEBAIC02OTcsNiArNzk1LDggQEAgc3Rh
dGljIGludCB2aG9zdF92ZHBhX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUg
KmZpbGVwKQo+ICAgCXZob3N0X2Rldl9pbml0KGRldiwgdnFzLCBudnFzLCAwLCAwLCAwLAo+ICAg
CQkgICAgICAgdmhvc3RfdmRwYV9wcm9jZXNzX2lvdGxiX21zZyk7Cj4gICAKPiArCXZob3N0X3Zk
cGFfcG9sbF9pbml0KGRldik7Cj4gKwo+ICAgCWRldi0+aW90bGIgPSB2aG9zdF9pb3RsYl9hbGxv
YygwLCAwKTsKPiAgIAlpZiAoIWRldi0+aW90bGIpIHsKPiAgIAkJciA9IC1FTk9NRU07CgoKU28g
bXkgZmVlbGluZyBoZXJlIGlzIHRoYXQgeW91IHdhbnQgdG8gcmV1c2UgdGhlIGluZnJhc3RydWN0
dXJlIGluIAp2aG9zdC5jIGFzIG11Y2ggYXMgcG9zc2libGUKCklmIHRoaXMgaXMgdHJ1ZSwgbGV0
J3MganVzdCBhdm9pZCBkdXBsaWNhdGluZyB0aGUgY29kZXMuIEhvdyBhYm91dCAKYWRkaW5nIHNv
bWV0aGluZyBsaWtlIGluIHZob3N0X3BvbGxfd2FrZXVwKCk6CgoKIMKgwqDCoCBzdHJ1Y3Qgdmhv
c3RfcG9sbCAqcG9sbCA9IGNvbnRhaW5lcl9vZih3YWl0LCBzdHJ1Y3Qgdmhvc3RfcG9sbCwgd2Fp
dCk7CiDCoMKgwqAgc3RydWN0IHZob3N0X3dvcmsgKndvcmsgPSAmcG9sbC0+d29yazsKCiDCoMKg
wqAgaWYgKCEoa2V5X3RvX3BvbGwoa2V5KSAmIHBvbGwtPm1hc2spKQogwqDCoMKgIMKgwqDCoCBy
ZXR1cm4gMDsKCiDCoMKgwqAgaWYgKCFwb2xsLT5kZXYtPnVzZV93b3JrZXIpCiDCoMKgwqAgwqDC
oMKgIHdvcmstPmZuKHdvcmspOwogwqDCoMKgIGVsc2UKIMKgwqDCoCDCoMKgwqAgdmhvc3RfcG9s
bF9xdWV1ZShwb2xsKTsKCgpUaGVuIG1vZGlmeSB2aG9zdF9kZXZfaW5pdCgpIHRvIHNldCB1c2Vf
d29ya2VyIChhbGwgdHJ1ZSBleGNlcHQgZm9yIHZkcGEpPwoKClRoYW5rcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
