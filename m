Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F46D7620
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 14:13:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EB3C5E1C;
	Tue, 15 Oct 2019 12:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1D747E04
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 98A675D3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 12:12:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9828669089;
	Tue, 15 Oct 2019 12:12:57 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E39A4608C0;
	Tue, 15 Oct 2019 12:12:35 +0000 (UTC)
Subject: Re: [PATCH V3 1/7] mdev: class id support
To: Cornelia Huck <cohuck@redhat.com>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-2-jasowang@redhat.com>
	<20191015122607.126e3960.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <084c7e28-8578-51f3-7b31-2231de8c636d@redhat.com>
Date: Tue, 15 Oct 2019 20:12:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015122607.126e3960.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 15 Oct 2019 12:12:58 +0000 (UTC)
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

Ck9uIDIwMTkvMTAvMTUg5LiL5Y2INjoyNiwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmks
IDExIE9jdCAyMDE5IDE2OjE1OjUxICswODAwCj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPj4gTWRldiBidXMgb25seSBzdXBwb3J0cyB2ZmlvIGRyaXZlciByaWdo
dCBub3csIHNvIGl0IGRvZXNuJ3QgaW1wbGVtZW50Cj4+IG1hdGNoIG1ldGhvZC4gQnV0IGluIHRo
ZSBmdXR1cmUsIHdlIG1heSBhZGQgZHJpdmVycyBvdGhlciB0aGFuIHZmaW8sCj4+IHRoZSBmaXJz
dCBkcml2ZXIgY291bGQgYmUgdmlydGlvLW1kZXYuIFRoaXMgbWVhbnMgd2UgbmVlZCB0byBhZGQK
Pj4gZGV2aWNlIGNsYXNzIGlkIHN1cHBvcnQgaW4gYnVzIG1hdGNoIG1ldGhvZCB0byBwYWlyIHRo
ZSBtZGV2IGRldmljZQo+PiBhbmQgbWRldiBkcml2ZXIgY29ycmVjdGx5Lgo+Pgo+PiBTbyB0aGlz
IHBhdGNoIGFkZHMgaWRfdGFibGUgdG8gbWRldl9kcml2ZXIgYW5kIGNsYXNzX2lkIGZvciBtZGV2
Cj4+IGRldmljZSB3aXRoIHRoZSBtYXRjaCBtZXRob2QgZm9yIG1kZXYgYnVzLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0IHwgIDcgKysr
KysrLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAgICAgICAgICAg
ICAgfCAgMSArCj4+ICAgZHJpdmVycy9zMzkwL2Npby92ZmlvX2Njd19vcHMuYyAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPj4gICBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3BzLmMgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAg
ICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwo+PiAgIGRyaXZlcnMvdmZpby9tZGV2
L21kZXZfZHJpdmVyLmMgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwo+PiAg
IGRyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4+ICAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgICAgICAgICAgICAgICAgICB8
ICA2ICsrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgOCArKysrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxl
LmggICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwo+PiAgIHNhbXBsZXMvdmZpby1tZGV2
L21ib2Nocy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICAgc2FtcGxlcy92Zmlv
LW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICBzYW1wbGVz
L3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+PiAgIDEz
IGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5y
c3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+
IGluZGV4IDI1ZWI3ZDViODM0Yi4uMjAzNWU0OGRhN2IyIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0Cj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QKPj4gQEAgLTEwMiwx
MiArMTAyLDE0IEBAIHN0cnVjdHVyZSB0byByZXByZXNlbnQgYSBtZWRpYXRlZCBkZXZpY2UncyBk
cml2ZXI6Ogo+PiAgICAgICAgICogQHByb2JlOiBjYWxsZWQgd2hlbiBuZXcgZGV2aWNlIGNyZWF0
ZWQKPj4gICAgICAgICAqIEByZW1vdmU6IGNhbGxlZCB3aGVuIGRldmljZSByZW1vdmVkCj4+ICAg
ICAgICAgKiBAZHJpdmVyOiBkZXZpY2UgZHJpdmVyIHN0cnVjdHVyZQo+PiArICAgICAgKiBAaWRf
dGFibGU6IHRoZSBpZHMgc2VydmljZWQgYnkgdGhpcyBkcml2ZXIKPj4gICAgICAgICAqLwo+PiAg
ICAgICAgc3RydWN0IG1kZXZfZHJpdmVyIHsKPj4gICAJICAgICBjb25zdCBjaGFyICpuYW1lOwo+
PiAgIAkgICAgIGludCAgKCpwcm9iZSkgIChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgIAkgICAg
IHZvaWQgKCpyZW1vdmUpIChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgIAkgICAgIHN0cnVjdCBk
ZXZpY2VfZHJpdmVyICAgIGRyaXZlcjsKPj4gKwkgICAgIGNvbnN0IHN0cnVjdCBtZGV2X2NsYXNz
X2lkICppZF90YWJsZTsKPj4gICAgICAgIH07Cj4+ICAgCj4+ICAgQSBtZWRpYXRlZCBidXMgZHJp
dmVyIGZvciBtZGV2IHNob3VsZCB1c2UgdGhpcyBzdHJ1Y3R1cmUgaW4gdGhlIGZ1bmN0aW9uIGNh
bGxzCj4+IEBAIC0xNjUsMTIgKzE2NywxNSBAQCByZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUgbWRl
diBjb3JlIGRyaXZlcjo6Cj4+ICAgCWV4dGVybiBpbnQgIG1kZXZfcmVnaXN0ZXJfZGV2aWNlKHN0
cnVjdCBkZXZpY2UgKmRldiwKPj4gICAJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IG1kZXZfcGFyZW50X29wcyAqb3BzKTsKPj4gICAKPj4gK0l0IGlzIGFsc28g
cmVxdWlyZWQgdG8gc3BlY2lmeSB0aGUgY2xhc3NfaWQgdGhyb3VnaDo6Cj4+ICsKPj4gKwlleHRl
cm4gaW50IG1kZXZfc2V0X2NsYXNzKHN0cnVjdCBkZXZpY2UgKmRldiwgdTE2IGlkKTsKPiBTaG91
bGQgdGhlIGRvY3VtZW50IHN0YXRlIGV4cGxpY2l0bHkgdGhhdCB0aGlzIHNob3VsZCBiZSBkb25l
IGluIHRoZQo+IC0+Y3JlYXRlKCkgY2FsbGJhY2s/CgoKWWVzLCBpdCdzIGJldHRlci4KCgo+IEFs
c28sIEkgdGhpbmsgdGhhdCB0aGUgY2xhc3NfaWQgbWlnaHQgYmUgZGlmZmVyZW50Cj4gZm9yIGRp
ZmZlcmVudCBtZGV2cyAoZXZlbiBpZiB0aGUgcGFyZW50IGlzIHRoZSBzYW1lKSAtLSBzaG91bGQg
dGhhdCBiZQo+IG1lbnRpb25lZCBleHBsaWNpdGx5PwoKClllcywgZGVwZW5kcyBvbiB0aGUgbWRl
dl9zdXBwb3J0ZWRfdHlwZS4KClRoYW5rcwoKCj4KPj4gKwo+PiAgIEhvd2V2ZXIsIHRoZSBtZGV2
X3BhcmVudF9vcHMgc3RydWN0dXJlIGlzIG5vdCByZXF1aXJlZCBpbiB0aGUgZnVuY3Rpb24gY2Fs
bAo+PiAgIHRoYXQgYSBkcml2ZXIgc2hvdWxkIHVzZSB0byB1bnJlZ2lzdGVyIGl0c2VsZiB3aXRo
IHRoZSBtZGV2IGNvcmUgZHJpdmVyOjoKPj4gICAKPj4gICAJZXh0ZXJuIHZvaWQgbWRldl91bnJl
Z2lzdGVyX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+PiAgIAo+PiAtCj4+ICAgTWVkaWF0
ZWQgRGV2aWNlIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFRocm91Z2ggc3lzZnMKPj4gICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiAgIAo+ICguLi4p
Cj4KPiBMb29rcyByZWFzb25hYmxlIHRvIG1lLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
