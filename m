Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54727DE3CF
	for <lists.virtualization@lfdr.de>; Mon, 21 Oct 2019 07:37:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 31A96DB9;
	Mon, 21 Oct 2019 05:37:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3B290DAF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 05:37:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 9F385896
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 05:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571636249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=tE5uTCurAopRyTHOj2V6FdY3SscvJMRhHjElCkCREn4=;
	b=W2mSuH/cyjyB+UbQJzMBgaBzdvU88dWVWiarQxuSlo5nkNkf0BUSBP/iJYS6VeqHhmn6nH
	3zuBeMABW+EgknMJYXINmXdZtUuoy1Ycrn5/8WPRsOqGoYR+Bk1xsw+0Kkitzrx8iMwuHH
	2lH2k7D5ZhDYFU6acC94HvTmjl09/+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-232-e3ln3-26PuSaJTQN-5zngA-1; Mon, 21 Oct 2019 01:37:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E079107AD31;
	Mon, 21 Oct 2019 05:37:22 +0000 (UTC)
Received: from [10.72.12.209] (ovpn-12-209.pek2.redhat.com [10.72.12.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B9D360BE2;
	Mon, 21 Oct 2019 05:36:21 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] mdev: introduce virtio device and its device ops
To: Cornelia Huck <cohuck@redhat.com>
References: <20191017104836.32464-1-jasowang@redhat.com>
	<20191017104836.32464-5-jasowang@redhat.com>
	<20191018114614.6f1e79dc.cohuck@redhat.com>
	<733c0cfe-064f-c8ba-6bf8-165db88d7e07@redhat.com>
	<20191018153042.3516cde1.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4a34d071-2e78-c37c-1046-7f9f6bb9e67f@redhat.com>
Date: Mon, 21 Oct 2019 13:36:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018153042.3516cde1.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: e3ln3-26PuSaJTQN-5zngA-1
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
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
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

Ck9uIDIwMTkvMTAvMTgg5LiL5Y2IOTozMCwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmks
IDE4IE9jdCAyMDE5IDE4OjU1OjAyICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gT24gMjAxOS8xMC8xOCDkuIvljYg1OjQ2LCBDb3JuZWxpYSBIdWNr
IHdyb3RlOgo+Pj4gT24gVGh1LCAxNyBPY3QgMjAxOSAxODo0ODozNCArMDgwMAo+Pj4gSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4gKyAqIEBnZXRfdmVuZG9yX2lk
OgkJR2V0IHZpcnRpbyB2ZW5kb3IgaWQKPj4+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmlj
ZQo+Pj4+ICsgKgkJCQlSZXR1cm5zIHUzMjogdmlydGlvIHZlbmRvciBpZAo+Pj4gSG93IGlzIHRo
ZSB2ZW5kb3IgaWQgZGVmaW5lZD8gQXMgZm9yIG5vcm1hbCB2aXJ0aW8tcGNpIGRldmljZXM/Cj4+
Cj4+IFRoZSB2ZW5kb3IgdGhhdCBwcm92aWRlcyB0aGlzIGRldmljZS4gU28gc29tZXRoaW5nIGxp
a2UgdGhpcwo+Pgo+PiBJIG5vdGljZSB0aGF0IE1NSU8gYWxzbyBoYWQgdGhpcyBzbyBpdCBsb29r
cyB0byBtZSBpdCdzIG5vdCBwY2kgc3BlY2lmaWMuCj4gT2suIFdvdWxkIGJlIGdvb2QgdG8gc3Bl
Y2lmeSB0aGlzIG1vcmUgZXhwbGljaXRseS4KCgpPay4KCgo+Cj4+Cj4+PiAgIAo+Pj4+ICsgKiBA
Z2V0X3N0YXR1czogCQlHZXQgdGhlIGRldmljZSBzdGF0dXMKPj4+PiArICoJCQkJQG1kZXY6IG1l
ZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlSZXR1cm5zIHU4OiB2aXJ0aW8gZGV2aWNlIHN0YXR1
cwo+Pj4+ICsgKiBAc2V0X3N0YXR1czogCQlTZXQgdGhlIGRldmljZSBzdGF0dXMKPj4+PiArICoJ
CQkJQG1kZXY6IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAc3RhdHVzOiB2aXJ0aW8gZGV2
aWNlIHN0YXR1cwo+Pj4+ICsgKiBAZ2V0X2NvbmZpZzogCQlSZWFkIGZyb20gZGV2aWNlIHNwZWNp
ZmljIGNvbmZpZ3VyYXRpb24gc3BhY2UKPj4+PiArICoJCQkJQG1kZXY6IG1lZGlhdGVkIGRldmlj
ZQo+Pj4+ICsgKgkJCQlAb2Zmc2V0OiBvZmZzZXQgZnJvbSB0aGUgYmVnaW5uaW5nIG9mCj4+Pj4g
KyAqCQkJCWNvbmZpZ3VyYXRpb24gc3BhY2UKPj4+PiArICoJCQkJQGJ1ZjogYnVmZmVyIHVzZWQg
dG8gcmVhZCB0bwo+Pj4+ICsgKgkJCQlAbGVuOiB0aGUgbGVuZ3RoIHRvIHJlYWQgZnJvbQo+Pj4+
ICsgKgkJCQljb25maWdyYXRpb24gc3BhY2UKPj4+PiArICogQHNldF9jb25maWc6IAkJV3JpdGUg
dG8gZGV2aWNlIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24gc3BhY2UKPj4+PiArICoJCQkJQG1kZXY6
IG1lZGlhdGVkIGRldmljZQo+Pj4+ICsgKgkJCQlAb2Zmc2V0OiBvZmZzZXQgZnJvbSB0aGUgYmVn
aW5uaW5nIG9mCj4+Pj4gKyAqCQkJCWNvbmZpZ3VyYXRpb24gc3BhY2UKPj4+PiArICoJCQkJQGJ1
ZjogYnVmZmVyIHVzZWQgdG8gd3JpdGUgZnJvbQo+Pj4+ICsgKgkJCQlAbGVuOiB0aGUgbGVuZ3Ro
IHRvIHdyaXRlIHRvCj4+Pj4gKyAqCQkJCWNvbmZpZ3JhdGlvbiBzcGFjZQo+Pj4+ICsgKiBAZ2V0
X21kZXZfZmVhdHVyZXM6CQlHZXQgdGhlIGZlYXR1cmUgb2YgdmlydGlvIG1kZXYgZGV2aWNlCj4+
Pj4gKyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4+PiArICoJCQkJUmV0dXJucyB0aGUg
bWRldiBmZWF0dXJlcyAoQVBJKSBzdXBwb3J0IGJ5Cj4+Pj4gKyAqCQkJCXRoZSBkZXZpY2UuCj4+
PiBXaGF0IGtpbmQgb2YgJ2ZlYXR1cmVzJyBhcmUgc3VwcG9zZWQgdG8gZ28gaW4gdGhlcmU/IEFy
ZSB0aGVzZSBiaXRzLAo+Pj4gbGlrZSB5b3UgZGVmaW5lZCBmb3IgVklSVElPX01ERVZfRl9WRVJT
SU9OXzEgYWJvdmU/Cj4+Cj4+IEl0J3MgdGhlIEFQSSBvciBtZGV2IGZlYXR1cmVzIG90aGVyIHRo
YW4gdmlydGlvIGZlYXR1cmVzLiBJdCBjb3VsZCBiZQo+PiB1c2VkIGJ5IGRyaXZlciB0byBkZXRl
cm1pbmUgdGhlIGNhcGFiaWxpdHkgb2YgdGhlIG1kZXYgZGV2aWNlLiBCZXNpZGVzCj4+IF9GX1ZF
UlNJT05fMSwgd2UgbWF5IGFkZCBkaXJ0eSBwYWdlIHRyYWNraW5nIGV0YyB3aGljaCBtZWFucyB3
ZSBuZWVkIG5ldwo+PiBkZXZpY2Ugb3BzLgo+IE9rLCBzbyB0aGF0J3Mgc3VwcG9zZWQgdG8gYmUg
ZGlzdGluY3QgYml0cyB0aGF0IGNhbiBiZSBvcidlZCB0b2dldGhlcj8KCgpZZXMuCgoKPiBNYWtl
cyBzZW5zZSwgYnV0IHByb2JhYmx5IG5lZWRzIHNvbWUgbW9yZSBkb2N1bWVudGF0aW9uIHNvbWV3
aGVyZS4KCgpMZXQgbWUgYWRkIHNvbWUgZG9jIGFib3ZlIHRoaXMgaGVscGVyLgoKCj4KPj4KPj4+
ICAgCj4+Pj4gKyAqIEBnZXRfZ2VuZXJhdGlvbjoJCUdldCBkZXZpY2UgZ2VuZXJhdG9uCj4+Pj4g
KyAqCQkJCUBtZGV2OiBtZWRpYXRlZCBkZXZpY2UKPj4+PiArICoJCQkJUmV0dXJucyB1MzI6IGRl
dmljZSBnZW5lcmF0aW9uCj4+PiBJcyB0aGF0IGNhbGxiYWNrIG1hbmRhdG9yeT8KPj4KPj4gSSB0
aGluayBzbywgaXQncyBoYXJkIHRvIGVtdWxhdGUgdGhhdCBjb21wbGV0ZWx5IGluIHZpcnRpby1t
ZGV2IHRyYW5zcG9ydC4KPiBJSVJDLCB0aGUgZ2VuZXJhdGlvbiBzdHVmZiBpcyBub3QgbWFuZGF0
b3J5IGluIHRoZSBjdXJyZW50IHZlcnNpb24gb2YKPiB2aXJ0aW8sIGFzIG5vdCBhbGwgdHJhbnNw
b3J0cyBoYXZlIHRoYXQgY29uY2VwdC4KCgpJdCBsb29rcyB0byBtZSB3ZSBjYW4gaGF2ZSB3b3Jr
YXJvdW5kIGFzIHdoYXQgaGFzIGJlZW4gZG9uZSBieSB2aXJ0aW8uYy4gClJldHVybiAwIGlmIHRo
aXMgaGVscGVyIGlzIG5vdCBwcm92aWRlZC4KCgo+Cj4gR2VuZXJhbGx5LCBhcmUgYW55IG9mIHRo
ZSBjYWxsYmFja3Mgb3B0aW9uYWwsIG9yIGFyZSBhbGwgb2YgdGhlbQo+IG1hbmRhdG9yeT8gRnJv
bSB3aGF0IEkgdW5kZXJzdGFuZCwgeW91IHBsYW4gdG8gYWRkIG5ldyB0aGluZ3MgdGhhdAo+IGRl
cGVuZCBvbiBmZWF0dXJlcy4uLiB3b3VsZCB0aGF0IG1lYW4gbm9uLW1hbmRhdG9yeSBjYWxsYmFj
a3M/CgoKWWVzLCBub3QgYWxsIG9mIHRoZW0gd2VyZSBtYW5kYXRvcnksIEkgd2lsbCBleHBsaWNp
dCBleHBsYWluIHdoaWNoIGFyZSAKbWFuZGF0b3J5IGFuZCB3aGljaCBhcmUgbm90LgoKVGhhbmtz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
