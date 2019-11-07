Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D4F3179
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 15:31:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D54B51551;
	Thu,  7 Nov 2019 14:31:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BE9031545
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 14:31:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3B157710
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573137075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=QrHdD94AcwG1Ax7bWiCTd//fNTx3IE4kMIx+0uxwiSM=;
	b=jV1JYaW0VsH7Gd4vmhJWhnK8LnielSO2GRGYcm0fak8Qt9+rRQcqVICU3Wa7d/Foh+uvIu
	oEGOlK96X7HQzoGjVyXsw3UtCLY6tVSNHMUf1fxHJea3WWO34FGW3zMHdApN6YuWA3mrlY
	HbGi4sf3B7QNxsic6ZRIlXI0jAexYns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-272-SpgoB20dMl6mpmpHXbbyGA-1; Thu, 07 Nov 2019 09:31:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33BB0477;
	Thu,  7 Nov 2019 14:31:06 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBAAB5D6D8;
	Thu,  7 Nov 2019 14:30:39 +0000 (UTC)
Subject: Re: [PATCH V9 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
To: Alex Williamson <alex.williamson@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>
References: <20191106070548.18980-1-jasowang@redhat.com>
	<20191106070548.18980-7-jasowang@redhat.com>
	<88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
	<20191106155800.0b8418ec@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1b26d298-0223-c5cc-9dd6-c4005139e32a@redhat.com>
Date: Thu, 7 Nov 2019 22:30:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106155800.0b8418ec@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: SpgoB20dMl6mpmpHXbbyGA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTEvNyDkuIrljYg2OjU4LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gV2Vk
LCA2IE5vdiAyMDE5IDE0OjUwOjMwIC0wODAwCj4gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+IHdyb3RlOgo+Cj4+IE9uIDExLzUvMTkgMTE6MDUgUE0sIEphc29uIFdhbmcgd3Jv
dGU6Cj4+PiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy9LY29uZmlnIGIvc2FtcGxlcy9LY29uZmlnCj4+
PiBpbmRleCBjOGRhY2I0ZGRhODAuLjEzYTI0NDNlMThlMCAxMDA2NDQKPj4+IC0tLSBhL3NhbXBs
ZXMvS2NvbmZpZwo+Pj4gKysrIGIvc2FtcGxlcy9LY29uZmlnCj4+PiBAQCAtMTMxLDYgKzEzMSwx
NiBAQCBjb25maWcgU0FNUExFX1ZGSU9fTURFVl9NRFBZCj4+PiAgIAkgIG1lZGlhdGVkIGRldmlj
ZS4gIEl0IGlzIGEgc2ltcGxlIGZyYW1lYnVmZmVyIGFuZCBzdXBwb3J0cwo+Pj4gICAJICB0aGUg
cmVnaW9uIGRpc3BsYXkgaW50ZXJmYWNlIChWRklPX0dGWF9QTEFORV9UWVBFX1JFR0lPTikuCj4+
PiAgIAo+Pj4gK2NvbmZpZyBTQU1QTEVfVklSVElPX01ERVZfTkVUCj4+PiArCXRyaXN0YXRlICJC
dWlsZCBWSVJUSU8gbmV0IGV4YW1wbGUgbWVkaWF0ZWQgZGV2aWNlIHNhbXBsZSBjb2RlIC0tIGxv
YWRhYmxlIG1vZHVsZXMgb25seSIKPj4+ICsJZGVwZW5kcyBvbiBWSVJUSU9fTURFViAmJiBWSE9T
VF9SSU5HICYmIG0KPj4+ICsJaGVscAo+Pj4gKwkgIEJ1aWxkIGEgbmV0d29ya2luZyBzYW1wbGUg
ZGV2aWNlIGZvciB1c2UgYXMgYSB2aXJ0aW8KPj4+ICsJICBtZWRpYXRlZCBkZXZpY2UuIFRoZSBk
ZXZpY2UgY29vcHJlYXRlcyB3aXRoIHZpcnRpby1tZGV2IGJ1cwo+PiB0eXBvIGhlcmU6Cj4+IAkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb29wZXJhdGVzCj4+Cj4gSSBjYW4gZml4IHRo
aXMgb24gY29tbWl0IHJlbGF0aXZlIHRvIFYxMCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgaXNzdWVz
Cj4gcmFpc2VkOgo+Cj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvS2NvbmZpZyBiL3NhbXBsZXMvS2Nv
bmZpZwo+IGluZGV4IDEzYTI0NDNlMThlMC4uYjcxMTZkOTdjYmJlIDEwMDY0NAo+IC0tLSBhL3Nh
bXBsZXMvS2NvbmZpZwo+ICsrKyBiL3NhbXBsZXMvS2NvbmZpZwo+IEBAIC0xMzYsNyArMTM2LDcg
QEAgY29uZmlnIFNBTVBMRV9WSVJUSU9fTURFVl9ORVQKPiAgICAgICAgICBkZXBlbmRzIG9uIFZJ
UlRJT19NREVWICYmIFZIT1NUX1JJTkcgJiYgbQo+ICAgICAgICAgIGhlbHAKPiAgICAgICAgICAg
IEJ1aWxkIGEgbmV0d29ya2luZyBzYW1wbGUgZGV2aWNlIGZvciB1c2UgYXMgYSB2aXJ0aW8KPiAt
ICAgICAgICAgbWVkaWF0ZWQgZGV2aWNlLiBUaGUgZGV2aWNlIGNvb3ByZWF0ZXMgd2l0aCB2aXJ0
aW8tbWRldiBidXMKPiArICAgICAgICAgbWVkaWF0ZWQgZGV2aWNlLiBUaGUgZGV2aWNlIGNvb3Bl
cmF0ZXMgd2l0aCB2aXJ0aW8tbWRldiBidXMKPiAgICAgICAgICAgIGRyaXZlciB0byBwcmVzZW50
IGFuIHZpcnRpbyBldGhlcm5ldCBkcml2ZXIgZm9yCj4gICAgICAgICAgICBrZXJuZWwuIEl0IHNp
bXBseSBsb29wYmFja3MgYWxsIHBhY2tldHMgZnJvbSBpdHMgVFgKPiAgICAgICAgICAgIHZpcnRx
dWV1ZSB0byBpdHMgUlggdmlydHF1ZXVlLgo+Cj4gVGhhbmtzLAo+IEFsZXgKCgpUaGFua3MsIHBl
ciBNaWNoYWVsIHJlcXVlc3QsIEkgd291bGQgcmVuYW1lIG12bmV0IGFuZCBpbmNsdWRlIHRoaXMg
Zml4IAppbiBWMTEuCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
