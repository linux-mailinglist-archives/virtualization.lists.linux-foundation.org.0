Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62ADE957
	for <lists.virtualization@lfdr.de>; Mon, 21 Oct 2019 12:22:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2FDCF1416;
	Mon, 21 Oct 2019 10:22:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5DDE21411
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 10:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E9CFB89B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571653326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=WOCT7wly6KfhuOArDnM97rOlSlf5dicr3quLe5triaA=;
	b=VXv0RvkEPM8YcIOeUxonAzARO9XBUCXG+OxWao4YVw4ZSHQjG298H1u+h3AramKO1X0EAn
	ma/aQrKEIY5W1s5LgGuhHSix5jS3wWuhmz2zART4Hk8YQ730C4kBIWhNDUq2BU1JRoEuMU
	cA5KYTfJ/rjuP4FRNtEhO/7SNE5cpYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-322-mVNupHU-OimsifvQ82L67A-1; Mon, 21 Oct 2019 06:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14CFC1005500;
	Mon, 21 Oct 2019 10:22:01 +0000 (UTC)
Received: from [10.72.12.22] (ovpn-12-22.pek2.redhat.com [10.72.12.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C574104F1;
	Mon, 21 Oct 2019 10:21:51 +0000 (UTC)
Subject: Re: [RFC 1/2] vhost: IFC VF hardware operation layer
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com
References: <20191016013050.3918-1-lingshan.zhu@intel.com>
	<20191016013050.3918-2-lingshan.zhu@intel.com>
	<2d711b6b-3bdc-afaa-8110-beebd6c5a896@redhat.com>
	<32d4c431-24f2-f9f0-8573-268abc7bb71c@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0fe6eb76-85a7-a1cb-5b11-8edb01dd65c7@redhat.com>
Date: Mon, 21 Oct 2019 18:21:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <32d4c431-24f2-f9f0-8573-268abc7bb71c@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mVNupHU-OimsifvQ82L67A-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjEg5LiL5Y2INTo1NywgWmh1LCBMaW5nc2hhbiB3cm90ZToKPgo+IE9uIDEw
LzE2LzIwMTkgNDo0NSBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAxOS8xMC8xNiDk
uIrljYg5OjMwLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+PiArICovCj4+PiArI2RlZmluZSBJRkNW
Rl9UUkFOU1BPUlRfRl9TVEFSVCAyOAo+Pj4gKyNkZWZpbmUgSUZDVkZfVFJBTlNQT1JUX0ZfRU5E
wqDCoCAzNAo+Pj4gKwo+Pj4gKyNkZWZpbmUgSUZDX1NVUFBPUlRFRF9GRUFUVVJFUyBcCj4+PiAr
wqDCoMKgwqDCoMKgwqAgKCgxVUxMIDw8IFZJUlRJT19ORVRfRl9NQUMpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IFwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICgxVUxMIDw8IFZJUlRJT19GX0FOWV9M
QVlPVVQpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IFwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICgx
VUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkgfCBcCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAoMVVM
TCA8PCBWSE9TVF9GX0xPR19BTEwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IFwKPj4KPj4KPj4g
TGV0J3MgYXZvaWQgdXNpbmcgVkhPU1RfRl9MT0dfQUxMLCB1c2luZyB0aGUgZ2V0X21kZXZfZmVh
dHVyZXMoKSAKPj4gaW5zdGVhZC4KPiBUaGFua3MsIEkgd2lsbCByZW1vdmUgVkhPU1RfRl9MT0df
QUxMCj4+Cj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoCAoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfR1VF
U1RfQU5OT1VOQ0UpwqDCoMKgwqDCoMKgwqAgfCBcCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAoMVVM
TCA8PCBWSVJUSU9fTkVUX0ZfQ1RSTF9WUSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgXAo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqAgKDFVTEwgPDwgVklSVElPX05FVF9GX1NUQVRVUynCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKDFVTEwgPDwgVklSVElPX05F
VF9GX01SR19SWEJVRikpIC8qIG5vdCBmdWxseSBzdXBwb3J0ZWQgKi8KPj4KPj4KPj4gV2h5IG5v
dCBoYXZpbmcgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0gYW5kIFZJUlRJT19GX09SREVSX1BMQVRG
T1JNPwo+Cj4gSSB3aWxsIGFkZCBWSVJUSU9fRl9PUkRFUl9QTEFURk9STSwgZm9yIFZJUlRJT19G
X0lPTU1VX1BMQVRGT1JNLCBpZiB3ZSAKPiBhZGQgdGhpcyBiaXQsIFFFTVUgbWF5IGVuYWJsZSB2
aW9tbXUsIGNhbiBjYXVzZSB0cm91YmxlcyBpbiBMTQoKClFlbXUgaGFzIG1hdHVyZSBzdXBwb3J0
IG9mIHZJT01NVSBzdXBwb3J0IGZvciBWRklPIGRldmljZSwgaXQgY2FuIHNoYWRvdyAKSU8gcGFn
ZSB0YWJsZXMgYW5kIHNldHVwIHRoZW0gdGhyb3VnaCBETUEgaW9jdGwgb2YgdmZpbyBjb250YWlu
ZXJzLiBBbnkgCmlzc3VlIHlvdSBzYXcgaGVyZT8KCkJ0dywgdG8gdGVzdCB0aGVtIHF1aWNrbHks
IHlvdSBjYW4gaW1wbGVtZW50IHNldF9jb25maWcvZ2V0X2NvbmZpZyBhbmQgCnRlc3QgdGhlbSB0
aHJvdWdoIHZpcnRpby1tZGV2L2tlcm5lbCBkcml2ZXJzIGFzIHdlbGwuCgpUaGFua3MKCgo+ICh0
aHJvdWdoIHdlIGRvbid0IHN1cHBvcnQgTE0gaW4gdGhpcyB2ZXJzaW9uIGRyaXZlcikKPgo+IFRo
YW5rcywKPiBCUgo+IFpodSBMaW5nc2hhbgo+Pgo+PiBUaGFua3MKPj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
