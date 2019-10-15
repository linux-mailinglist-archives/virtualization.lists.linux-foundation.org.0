Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F876D7630
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 14:14:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D5597E21;
	Tue, 15 Oct 2019 12:13:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8CEA4E21
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:13:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 417C189D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:13:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C5E2306F4AE;
	Tue, 15 Oct 2019 12:13:53 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B70B608C0;
	Tue, 15 Oct 2019 12:13:31 +0000 (UTC)
Subject: Re: [PATCH V3 2/7] mdev: bus uevent support
To: Cornelia Huck <cohuck@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-3-jasowang@redhat.com>
	<20191015122707.1fd52240.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <515d31c5-a7d9-5a22-b570-2035ecf03c09@redhat.com>
Date: Tue, 15 Oct 2019 20:13:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015122707.1fd52240.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 15 Oct 2019 12:13:53 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
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

Ck9uIDIwMTkvMTAvMTUg5LiL5Y2INjoyNywgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmks
IDExIE9jdCAyMDE5IDE2OjE1OjUyICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gVGhpcyBwYXRjaCBhZGRzIGJ1cyB1ZXZlbnQgc3VwcG9ydCBmb3Ig
bWRldiBidXMgaW4gb3JkZXIgdG8gYWxsb3cKPj4gY29vcGVyYXRpb24gd2l0aCB1c2Vyc3BhY2Uu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMgfCA4ICsrKysrKysrCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJp
dmVyLmMKPj4gaW5kZXggYjdjNDBjZTg2ZWUzLi4zMTlkODg2ZmZhZjcgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvdmZpby9tZGV2L21kZXZfZHJpdmVyLmMKPj4gKysrIGIvZHJpdmVycy92ZmlvL21k
ZXYvbWRldl9kcml2ZXIuYwo+PiBAQCAtODIsOSArODIsMTcgQEAgc3RhdGljIGludCBtZGV2X21h
dGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKPj4gICAJ
cmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIGludCBtZGV2X3VldmVudChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBrb2JqX3VldmVudF9lbnYgKmVudikKPj4gK3sKPj4gKwlzdHJ1
Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSB0b19tZGV2X2RldmljZShkZXYpOwo+PiArCj4+ICsJcmV0
dXJuIGFkZF91ZXZlbnRfdmFyKGVudiwgIk1PREFMSUFTPW1kZXY6YyUwMlgiLCBtZGV2LT5jbGFz
c19pZCk7Cj4+ICt9Cj4+ICsKPj4gICBzdHJ1Y3QgYnVzX3R5cGUgbWRldl9idXNfdHlwZSA9IHsK
Pj4gICAJLm5hbWUJCT0gIm1kZXYiLAo+PiAgIAkubWF0Y2gJCT0gbWRldl9tYXRjaCwKPj4gKwku
dWV2ZW50CQk9IG1kZXZfdWV2ZW50LAo+PiAgIAkucHJvYmUJCT0gbWRldl9wcm9iZSwKPj4gICAJ
LnJlbW92ZQkJPSBtZGV2X3JlbW92ZSwKPj4gICB9Owo+IEknZCBtZXJnZSB0aGF0IGludG8gdGhl
IHByZXZpb3VzIHBhdGNoLgoKCldpbGwgZG8uCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
