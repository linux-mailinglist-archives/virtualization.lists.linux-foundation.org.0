Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E15E3A0
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 14:16:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 46C05FB0;
	Wed,  3 Jul 2019 12:16:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B22CDF4B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 12:16:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1F3D770D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 12:16:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35E6530872E8;
	Wed,  3 Jul 2019 12:16:41 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9EF5D9DE;
	Wed,  3 Jul 2019 12:16:25 +0000 (UTC)
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<7b8279b2-aa7e-7adc-eeff-20dfaf4400d0@redhat.com>
	<20190703115245.GA22374@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
Date: Wed, 3 Jul 2019 20:16:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703115245.GA22374@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 03 Jul 2019 12:16:41 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com
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

Ck9uIDIwMTkvNy8zIOS4i+WNiDc6NTIsIFRpd2VpIEJpZSB3cm90ZToKPiBPbiBXZWQsIEp1bCAw
MywgMjAxOSBhdCAwNjowOTo1MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDE5
LzcvMyDkuIvljYg1OjEzLCBUaXdlaSBCaWUgd3JvdGU6Cj4+PiBEZXRhaWxzIGFib3V0IHRoaXMg
Y2FuIGJlIGZvdW5kIGhlcmU6Cj4+Pgo+Pj4gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzc1MDc3
MC8KPj4+Cj4+PiBXaGF0J3MgbmV3IGluIHRoaXMgdmVyc2lvbgo+Pj4gPT09PT09PT09PT09PT09
PT09PT09PT09PT0KPj4+Cj4+PiBBIG5ldyBWRklPIGRldmljZSB0eXBlIGlzIGludHJvZHVjZWQg
LSB2ZmlvLXZob3N0LiBUaGlzIGFkZHJlc3NlZAo+Pj4gc29tZSBjb21tZW50cyBmcm9tIGhlcmU6
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY292ZXIvOTg0NzYzLwo+Pj4KPj4+IEJlbG93
IGlzIHRoZSB1cGRhdGVkIGRldmljZSBpbnRlcmZhY2U6Cj4+Pgo+Pj4gQ3VycmVudGx5LCB0aGVy
ZSBhcmUgdHdvIHJlZ2lvbnMgb2YgdGhpcyBkZXZpY2U6IDEpIENPTkZJR19SRUdJT04KPj4+IChW
RklPX1ZIT1NUX0NPTkZJR19SRUdJT05fSU5ERVgpLCB3aGljaCBjYW4gYmUgdXNlZCB0byBzZXR1
cCB0aGUKPj4+IGRldmljZTsgMikgTk9USUZZX1JFR0lPTiAoVkZJT19WSE9TVF9OT1RJRllfUkVH
SU9OX0lOREVYKSwgd2hpY2gKPj4+IGNhbiBiZSB1c2VkIHRvIG5vdGlmeSB0aGUgZGV2aWNlLgo+
Pj4KPj4+IDEuIENPTkZJR19SRUdJT04KPj4+Cj4+PiBUaGUgcmVnaW9uIGRlc2NyaWJlZCBieSBD
T05GSUdfUkVHSU9OIGlzIHRoZSBtYWluIGNvbnRyb2wgaW50ZXJmYWNlLgo+Pj4gTWVzc2FnZXMg
d2lsbCBiZSB3cml0dGVuIHRvIG9yIHJlYWQgZnJvbSB0aGlzIHJlZ2lvbi4KPj4+Cj4+PiBUaGUg
bWVzc2FnZSB0eXBlIGlzIGRldGVybWluZWQgYnkgdGhlIGByZXF1ZXN0YCBmaWVsZCBpbiBtZXNz
YWdlCj4+PiBoZWFkZXIuIFRoZSBtZXNzYWdlIHNpemUgaXMgZW5jb2RlZCBpbiB0aGUgbWVzc2Fn
ZSBoZWFkZXIgdG9vLgo+Pj4gVGhlIG1lc3NhZ2UgZm9ybWF0IGxvb2tzIGxpa2UgdGhpczoKPj4+
Cj4+PiBzdHJ1Y3Qgdmhvc3RfdmZpb19vcCB7Cj4+PiAJX191NjQgcmVxdWVzdDsKPj4+IAlfX3Uz
MiBmbGFnczsKPj4+IAkvKiBGbGFnIHZhbHVlczogKi8KPj4+ICAgICNkZWZpbmUgVkhPU1RfVkZJ
T19ORUVEX1JFUExZIDB4MSAvKiBXaGV0aGVyIG5lZWQgcmVwbHkgKi8KPj4+IAlfX3UzMiBzaXpl
Owo+Pj4gCXVuaW9uIHsKPj4+IAkJX191NjQgdTY0Owo+Pj4gCQlzdHJ1Y3Qgdmhvc3RfdnJpbmdf
c3RhdGUgc3RhdGU7Cj4+PiAJCXN0cnVjdCB2aG9zdF92cmluZ19hZGRyIGFkZHI7Cj4+PiAJfSBw
YXlsb2FkOwo+Pj4gfTsKPj4+Cj4+PiBUaGUgZXhpc3Rpbmcgdmhvc3Qta2VybmVsIGlvY3RsIGNt
ZHMgYXJlIHJldXNlZCBhcyB0aGUgbWVzc2FnZQo+Pj4gcmVxdWVzdHMgaW4gYWJvdmUgc3RydWN0
dXJlLgo+Pgo+PiBTdGlsbCBhIGNvbW1lbnRzIGxpa2UgVjEuIFdoYXQncyB0aGUgYWR2YW50YWdl
IG9mIGludmVudGluZyBhIG5ldyBwcm90b2NvbD8KPiBJJ20gdHJ5aW5nIHRvIG1ha2UgaXQgd29y
ayBpbiBWRklPJ3Mgd2F5Li4KPgo+PiBJIGJlbGlldmUgZWl0aGVyIG9mIHRoZSBmb2xsb3dpbmcg
c2hvdWxkIGJlIGJldHRlcjoKPj4KPj4gLSB1c2luZyB2aG9zdCBpb2N0bCzCoCB3ZSBjYW4gc3Rh
cnQgZnJvbSBTRVRfVlJJTkdfS0lDSy9TRVRfVlJJTkdfQ0FMTCBhbmQKPj4gZXh0ZW5kIGl0IHdp
dGggZS5nIG5vdGlmeSByZWdpb24uIFRoZSBhZHZhbnRhZ2VzIGlzIHRoYXQgYWxsIGV4aXN0IHVz
ZXJzcGFjZQo+PiBwcm9ncmFtIGNvdWxkIGJlIHJldXNlZCB3aXRob3V0IG1vZGlmaWNhdGlvbiAo
b3IgbWluaW1hbCBtb2RpZmljYXRpb24pLiBBbmQKPj4gdmhvc3QgQVBJIGhpZGVzIGxvdHMgb2Yg
ZGV0YWlscyB0aGF0IGlzIG5vdCBuZWNlc3NhcnkgdG8gYmUgdW5kZXJzdG9vZCBieQo+PiBhcHBs
aWNhdGlvbiAoZS5nIGluIHRoZSBjYXNlIG9mIGNvbnRhaW5lcikuCj4gRG8geW91IG1lYW4gcmV1
c2luZyB2aG9zdCdzIGlvY3RsIG9uIFZGSU8gZGV2aWNlIGZkIGRpcmVjdGx5LAo+IG9yIGludHJv
ZHVjaW5nIGFub3RoZXIgbWRldiBkcml2ZXIgKGkuZS4gdmhvc3RfbWRldiBpbnN0ZWFkIG9mCj4g
dXNpbmcgdGhlIGV4aXN0aW5nIHZmaW9fbWRldikgZm9yIG1kZXYgZGV2aWNlPwoKCkNhbiB3ZSBz
aW1wbHkgYWRkIHRoZW0gaW50byBpb2N0bCBvZiBtZGV2X3BhcmVudF9vcHM/CgoKPgo+PiAtIHVz
aW5nIFBDSSBsYXlvdXQsIHRoZW4geW91IGRvbid0IGV2ZW4gbmVlZCB0byByZS1pbnZlbnQgbm90
aWZpeSByZWdpb24gYXQKPj4gYWxsIGFuZCB3ZSBjYW4gcGFzcy10aHJvdWdoIHRoZW0gdG8gZ3Vl
c3QuCj4gTGlrZSB3aGF0IHlvdSBzYWlkIHByZXZpb3VzbHksIHZpcnRpbyBoYXMgdHJhbnNwb3J0
cyBvdGhlciB0aGFuIFBDSS4KPiBBbmQgaXQgd2lsbCBsb29rIGEgYml0IG9kZCB3aGVuIHVzaW5n
IHRyYW5zcG9ydHMgb3RoZXIgdGhhbiBQQ0kuLgoKClllcy4KCgo+Cj4+IFBlcnNvbmFsbHksIEkg
cHJlZmVyIHZob3N0IGlvY3RsLgo+ICsxCj4KPj4KPiBbLi4uXQo+Pj4gMy4gVkZJTyBpbnRlcnJ1
cHQgaW9jdGwgQVBJCj4+Pgo+Pj4gVkZJTyBpbnRlcnJ1cHQgaW9jdGwgQVBJIGlzIHVzZWQgdG8g
c2V0dXAgZGV2aWNlIGludGVycnVwdHMuCj4+PiBJUlEtYnlwYXNzIGNhbiBhbHNvIGJlIHN1cHBv
cnRlZC4KPj4+Cj4+PiBDdXJyZW50bHksIHRoZSBkYXRhIHBhdGggaW50ZXJydXB0IGNhbiBiZSBj
b25maWd1cmVkIHZpYSB0aGUKPj4+IFZGSU9fVkhPU1RfVlFfSVJRX0lOREVYIHdpdGggdmlydHF1
ZXVlJ3MgY2FsbGZkLgo+Pgo+PiBIb3cgYWJvdXQgRE1BIEFQST8gRG8geW91IGV4cGVjdCB0byB1
c2UgVkZJTyBJT01NVSBBUEkgb3IgdXNpbmcgdmhvc3QKPj4gU0VUX01FTV9UQUJMRT8gVkZJTyBJ
T01NVSBBUEkgaXMgbW9yZSBnZW5lcmljIGZvciBzdXJlIGJ1dCB3aXRoCj4+IFNFVF9NRU1fVEFC
TEUgRE1BIGNhbiBiZSBkb25lIGF0IHRoZSBsZXZlbCBvZiBwYXJlbnQgZGV2aWNlIHdoaWNoIG1l
YW5zIGl0Cj4+IGNhbiB3b3JrIGZvciBlLmcgdGhlIGNhcmQgd2l0aCBvbi1jaGlwIElPTU1VLgo+
IEFncmVlLiBJbiB0aGlzIFJGQywgaXQgYXNzdW1lcyB1c2Vyc3BhY2Ugd2lsbCB1c2UgVkZJTyBJ
T01NVSBBUEkKPiB0byBkbyB0aGUgRE1BIHByb2dyYW1taW5nLiBCdXQgbGlrZSB3aGF0IHlvdSBz
YWlkLCB0aGVyZSBjb3VsZCBiZQo+IGEgcHJvYmxlbSB3aGVuIHVzaW5nIGNhcmRzIHdpdGggb24t
Y2hpcCBJT01NVS4KCgpZZXMsIGFub3RoZXIgaXNzdWUgaXMgU0VUX01FTV9UQUJMRSBjYW4gbm90
IGJlIHVzZWQgdG8gdXBkYXRlIGp1c3QgYSAKcGFydCBvZiB0aGUgdGFibGUuIFRoaXMgc2VlbXMg
bGVzcyBmbGV4aWJsZSB0aGFuIFZGSU8gQVBJIGJ1dCBpdCBjb3VsZCAKYmUgZXh0ZW5kZWQuCgoK
Pgo+PiBBbmQgd2hhdCdzIHRoZSBwbGFuIGZvciB2SU9NTVU/Cj4gQXMgdGhpcyBSRkMgYXNzdW1l
cyB1c2Vyc3BhY2Ugd2lsbCB1c2UgVkZJTyBJT01NVSBBUEksIHVzZXJzcGFjZQo+IGp1c3QgbmVl
ZHMgdG8gZm9sbG93IHRoZSBzYW1lIHdheSBsaWtlIHdoYXQgdmZpby1wY2kgZGV2aWNlIGRvZXMK
PiBpbiBRRU1VIHRvIHN1cHBvcnQgdklPTU1VLgoKClJpZ2h0LCB0aGlzIGlzIG1vcmUgYSBxdWVz
dGlvbiBmb3IgdGhlIHFlbXUgcGFydC4gSXQgbWVhbnMgaXQgbmVlZHMgdG8gCmdvIGZvciBvcmRp
bmFyeSBWRklPIHBhdGggdG8gZ2V0IGFsbCBub3RpZmllcnMvbGlzdGVuZXJzIHN1cHBvcnQgZnJv
bSAKdklPTU1VLgoKCj4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRpd2VpIEJpZSA8dGl3ZWkuYmll
QGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy92aG9zdC9NYWtlZmlsZSAgICAgfCAg
IDIgKwo+Pj4gICAgZHJpdmVycy92aG9zdC92ZHBhLmMgICAgICAgfCA3NzAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICAgaW5jbHVkZS9saW51eC92ZHBhX21kZXYu
aCAgfCAgNzIgKysrKwo+Pj4gICAgaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCAgfCAgMTkgKwo+
Pj4gICAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmggfCAgMjUgKysKPj4+ICAgIDUgZmlsZXMg
Y2hhbmdlZCwgODg4IGluc2VydGlvbnMoKykKPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3Zob3N0L3ZkcGEuYwo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgv
dmRwYV9tZGV2LmgKPj4KPj4gV2UgcHJvYmFibHkgbmVlZCBzb21lIHNhbXBsZSBwYXJlbnQgZGV2
aWNlIGltcGxlbWVudGF0aW9uLiBJdCBjb3VsZCBiZSBhCj4+IHNvZnR3YXJlIGRhdGFwYXRoIGxp
a2UgZS5nIHdlIGNhbiBzdGFydCBmcm9tIHZpcnRpby1uZXQgZGV2aWNlIGluIGd1ZXN0IG9yIGEK
Pj4gdmhvc3QvdGFwIG9uIGhvc3QuCj4gWWVhaCwgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCBi
ZSBpbnRlcmVzdGluZyEKCgpQbGFuIHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQgOikgPwoKVGhh
bmtzCgoKPgo+IFRoYW5rcywKPiBUaXdlaQo+Cj4+IFRoYW5rcwo+Pgo+PgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
