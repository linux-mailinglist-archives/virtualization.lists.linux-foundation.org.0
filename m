Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839D6A79FE
	for <lists.virtualization@lfdr.de>; Thu,  2 Mar 2023 04:24:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2AC3419F4;
	Thu,  2 Mar 2023 03:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AC3419F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IWLSbYhxcX5B; Thu,  2 Mar 2023 03:24:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C0BE8419A8;
	Thu,  2 Mar 2023 03:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BE8419A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02A02C007E;
	Thu,  2 Mar 2023 03:24:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 381E9C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 03:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1270981D5F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 03:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1270981D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9Ix7Mi96qN3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 03:24:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A891C81D47
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A891C81D47
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 03:24:10 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VcvKvhO_1677727443; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VcvKvhO_1677727443) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 11:24:04 +0800
Message-ID: <1677727282.6062915-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost 07/10] virtio_ring: add api virtio_dma_map() for
 advance dma
Date: Thu, 2 Mar 2023 11:21:22 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20230214072704.126660-1-xuanzhuo@linux.alibaba.com>
 <20230214072704.126660-8-xuanzhuo@linux.alibaba.com>
 <CACGkMEs_jQd84LSC5F_at0+G_D=JnBWOJH71B5=RQFPYQKwtBg@mail.gmail.com>
 <1676876377.4263525-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvxyV9fAyN1L_vqRvQGzA5XnmhviVFKZdNJS6oKqGLpBA@mail.gmail.com>
 <1677582923.193659-3-xuanzhuo@linux.alibaba.com>
 <1677722698.850823-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEsMjn6-H2mLkP0gGZ-YFVPdnruLDykBqO00xecU8D7mQw@mail.gmail.com>
In-Reply-To: <CACGkMEsMjn6-H2mLkP0gGZ-YFVPdnruLDykBqO00xecU8D7mQw@mail.gmail.com>
Cc: maciej.fijalkowski@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, bjorn@kernel.org,
 jonathan.lemon@gmail.com, magnus.karlsson@intel.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCAyIE1hciAyMDIzIDExOjA1OjI2ICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDEwOjI04oCvQU0gWHVh
biBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVl
LCAyOCBGZWIgMjAyMyAxOToxNToyMyArMDgwMCwgWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMjEgRmViIDIwMjMgMDk6NTE6MDcgKzA4
MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIE1v
biwgRmViIDIwLCAyMDIzIGF0IDM6MDIgUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGli
YWJhLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCAyMCBGZWIgMjAyMyAx
MzozODoyNCArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4g
PiA+ID4gPiA+IE9uIFR1ZSwgRmViIDE0LCAyMDIzIGF0IDM6MjcgUE0gWHVhbiBaaHVvIDx4dWFu
emh1b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBBZGRlZCB2aXJ0aW9fZG1hX21hcCgpIHRvIG1hcCBETUEgYWRkcmVzc2VzIGZvciB2aXJ0dWFs
IG1lbW9yeSBpbgo+ID4gPiA+ID4gPiA+IGFkdmFuY2UuIFRoZSBwdXJwb3NlIGlzIHRvIGtlZXAg
bWVtb3J5IG1hcHBlZCBhY3Jvc3MgbXVsdGlwbGUgYWRkL2dldAo+ID4gPiA+ID4gPiA+IGJ1ZiBv
cGVyYXRpb25zLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHdvbmRlciBpZiBpbnN0ZWFkIG9m
IGV4cG9ydGluZyBoZWxwZXJzIGxpa2UgdGhpcywgaXQgbWlnaHQgYmUgc2ltcGxlCj4gPiA+ID4g
PiA+IHRvIGp1c3QgZXhwb3J0IGRtYV9kZXYgdGhlbiB0aGUgdXBwZXIgbGF5ZXIgY2FuIHVzZSBE
TUEgQVBJIGF0IHdpbGw/Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSByZWFzb24g
Zm9yIG5vdCBkb2luZyB0aGlzLCBWaXJ0aW8gaXMgbm90IGp1c3QgdXNpbmcgRE1BX0RFViB0byBt
YXBwLCBidXQKPiA+ID4gPiA+IGFsc28gY2hlY2sgd2hldGhlciBETUEgaXMgdXNlZC4KPiA+ID4g
Pgo+ID4gPiA+IFdlIHNob3VsZCBsZXQgdGhlIERNQSBBUEkgZGVjaWRlIGJ5IGV4cG9ydGluZyBh
IGNvcnJlY3QgZG1hX2Rldi4gRS5nCj4gPiA+ID4gd2hlbiBBQ0NFU1NfUExBVEZPUk0gaXMgbm90
IG5lZ290aWF0ZWQsIGFkdmVydGlzaW5nIGEgRE1BIGRldiB3aXRob3V0Cj4gPiA+ID4gZG1hX29w
cy4KPiA+ID4KPiA+ID4KPiA+ID4gRG8geW91IG1lYW4gd2UgcHJvdmlkZSB0aGlzIEFQST8KPiA+
ID4KPiA+ID4gdmlydGlvX2dldF9kbWFfZGV2KCkKPiA+ID4KPiA+ID4gSWYgaXQgcmV0dXJucyBO
VUxMLCB0aGUgY2FsbGVyIHdpbGwgdXNlIHRoZSBwaHlzaWNhbCBtZW1vcnkgYWRkcmVzcyBkaXJl
Y3RseS4gSWYKPiA+ID4gdGhpcyBmdW5jIHJldHVybiBhIGRtYV9kZXYsIHRoZSBjYWxsZXIgc2hv
dWxkIHVzZSBETUEgQVBJLgo+ID4KPiA+Cj4gPiBjYyB0aGUgWERQX1NPQ0tFVCdzIG1haW50YWlu
ZXJzLgo+ID4KPiA+IEZpcnN0IG9mIGFsbCwgSmFzb24gZG9lcyBub3Qgd2FudCB0byBlbmNhcHN1
bGF0ZSB0aGUgQVBJIG9mIERNQSBieSBWaXJ0aW8uIEl0IGlzCj4gPiBiZXN0IHRvIHBhc3MgRE1B
IERldmljZSB0byBYU0ssIFhTSyB1c2VzIERNQSBBUEkgZm9yIERNQSBNQVAgb3BlcmF0aW9uIGRp
cmVjdGx5Lgo+ID4gSSBhZ3JlZSB3aXRoIHRoaXMgaWRlYS4KPiA+Cj4gPiBIb3dldmVyLCB0aGVy
ZSBhcmUgc2V2ZXJhbCBwcm9ibGVtcyB1bmRlciBWaXJ0aW86Cj4gPiAxLiBJbiBzb21lIHZpcnR1
YWxpemF0aW9uIHNjZW5hcmlvcywgd2UgZG8gbm90IGhhdmUgdG8gcGVyZm9ybSBETUEgb3BlcmF0
aW9ucywKPiA+ICAgIGp1c3QgdXNlIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGRpcmVjdGx5Lgo+Cj4g
VGhpcyBpcyBub3QgYSBwcm9ibGVtLCB3ZSBjYW4gc2ltcGx5IHJldHVybiB0aGUgdmlydGlvIGRl
dmljZSBpdHNlbGYKPiBhcyB0aGUgRE1BIGRldmljZSBpbiB0aGlzIGNhc2UuIFNpbmNlIHRoZXJl
J3Mgbm8gRE1BIG9wcyBhdHRhY2hlZCwgRE1BCj4gQVBJIHdpbGwgdXNlIHBoeXNpY2FsIGFkZHJl
c3MgaW4gdGhpcyBjYXNlLgoKSXMgdGhpcyBsaWtlIHRoaXM/IFNvIHdoeSBkbyB3ZSBoYXZlIHRv
IGRlYWwgd2l0aCBpdCBpbiBWaXJ0aW8gUmluZz8gTGV0IG1lCmxlYXJuIGl0LgoKCj4KPiA+IDIu
IFRoZSBsYXRlc3QgVmlydGlvIENvcmUgc3VwcG9ydHMgZWFjaCByeC90eCBxdWV1ZSB3aXRoIG9u
ZSBETUEgZGV2aWNlLgo+ID4gICAgR2VuZXJhbGx5LCB0aGUgcGh5c2ljYWwgbmV0d29yayBjYXJk
IGhhcyBvbmx5IG9uZSBkZXZpY2UuIEFsbCBxdWV1ZXMgdXNlCj4gPiAgICBpdCBmb3IgRE1BIG9w
ZXJhdGlvbi4KPgo+IEknbSBub3Qgc3VyZSB0aGlzIGlzIGEgYmlnIGRlYWwsIHdlIGp1c3QgbmVl
ZCB0byB1c2UgdGhlIHBlciB2aXJ0cXVldWUKPiBkbWEgZGV2aWNlIHRvIHVzZSBETUEgQVBJLgoK
WWVzLgoKCj4KPiA+Cj4gPiBTbyBJIGNvbnNpZGVyIHRoaXMgcHJvYmxlbSBhZ2FpbiwgVmlydGlv
IENvcmUgcHJvdmlkZXMgb25seSBvbmUgQVBJLgo+ID4KPiA+ICogdmlydGlvX2dldF9kbWFfZGV2
KHF1ZXVlKQo+ID4KPiA+IElmIHRoZSByZXR1cm4gdmFsdWUgaXMgTlVMTCwgaXQgbWVhbnMgdGhh
dCB0aGVyZSBpcyBubyBETUEgb3BlcmF0aW9uLiBJZiBpdCBpcwo+ID4gbm90IE5VTEwsIHVzZSBE
TUEgQVBJIGZvciBETUEgb3BlcmF0aW9uLgo+ID4KPiA+IFRoZSBtb2RpZmljYXRpb24gb2YgWFNL
IGlzIGxpa2UgdGhpcy4gV2UgbWF5IHBhc3MgTlVMTCBhcyBkZXYgdG8geHBfZG1hX21hcCgpLgo+
ID4gSWYgZGV2IGlzIE5VTEwsIHRoZW4gdGhlcmUgaXMgbm8gbmVlZCB0byBwZXJmb3JtIERNQSBh
bmQgU3luYyBvcGVyYXRpb25zLgo+ID4gT3RoZXJ3aXNlLCBpdCB3aWxsIHBlcmZvcm0gRE1BIG9w
ZXJhdGlvbnMgbGlrZSBvdGhlciBkZXZpY2VzLgo+Cj4gQXMgZGlzY3Vzc2VkIGFib3ZlLCBpdCBt
aWdodCBiZSBlYXNpZXI6Cj4KPiAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoVklSVElPX0Zf
QUNDRVNTX1BMQVRGT1JNKSkKPiAgICAgICAgIHJldHVybiB2aXJ0aW9fZGV2aWNlOwo+ICAgICBl
bHNlCj4gICAgICAgICByZXR1cm4gdnJpbmdfZG1hX2RldigpOwoKWWVzLCBhY2NvcmRpbmcgdG8g
SmFzb24ncyBvcGluaW9uLCB0aGVuIFhTSyBub3QgbmVlZCB0byBkbyBhbnkgbW9kaWZpY2F0aW9u
cy4KClRoYW5rcy4KCj4KPiA+Cj4gPiBBbmQgaWYgdGhlIGRtYV9kZXYgb2YgcnggYW5kIHR4IGlz
IGRpZmZlcmVudCwgdGhlbiB3ZSBjYW4gb25seSBkaXNhYmxlCj4gPiBYRFBfU09DS0VULgo+Cj4g
V2UgY2FuIHN0YXJ0IHdpdGggdGhpcy4KPgo+IFRoYW5rcwo+Cj4gPgo+ID4gTG9va2luZyBmb3J3
YXJkIHRvIGV2ZXJ5b25lJ3MgcmVwbHkuCj4gPgo+ID4gVGhhbmtzLgo+ID4KPiA+ID4KPiA+ID4g
VGhhbmtzLgo+ID4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzCj4gPiA+ID4KPiA+ID4g
PiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAoT3RoZXJ3aXNlIHRoZSBETUEg
aGVscGVycyBuZWVkIHRvIGdyb3cvc2hyaW5rIGFzIHRoZSBETUEgQVBJIGV2b2x2ZXM/KQo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQWRkZWQgdmlydGlvX2RtYV91bm1h
cCgpIGZvciB1bm1hcCBETUEgYWRkcmVzcy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+
ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMg
fCA5MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gPiAg
aW5jbHVkZS9saW51eC92aXJ0aW8uaCAgICAgICB8ICA5ICsrKysKPiA+ID4gPiA+ID4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgYi9kcml2ZXJzL3Zp
cnRpby92aXJ0aW9fcmluZy5jCj4gPiA+ID4gPiA+ID4gaW5kZXggY2Q5MzY0ZWIyMzQ1Li44NTUz
Mzg2MDljN2YgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlv
X3JpbmcuYwo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMK
PiA+ID4gPiA+ID4gPiBAQCAtMzE3Miw0ICszMTcyLDk2IEBAIGNvbnN0IHN0cnVjdCB2cmluZyAq
dmlydHF1ZXVlX2dldF92cmluZyhzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKPiA+ID4gPiA+ID4gPiAg
fQo+ID4gPiA+ID4gPiA+ICBFWFBPUlRfU1lNQk9MX0dQTCh2aXJ0cXVldWVfZ2V0X3ZyaW5nKTsK
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICsvKioKPiA+ID4gPiA+ID4gPiArICogdmlydGlv
X2RtYV9tYXBfcGFnZSAtIGdldCB0aGUgRE1BIGFkZHIgb2YgdGhlIG1lbW9yeSBmb3IgdmlydGlv
IGRldmljZQo+ID4gPiA+ID4gPiA+ICsgKiBAZGV2OiB2aXJ0aW8gZGV2aWNlCj4gPiA+ID4gPiA+
ID4gKyAqIEBwYWdlOiB0aGUgcGFnZSBvZiB0aGUgbWVtb3J5IHRvIERNQQo+ID4gPiA+ID4gPiA+
ICsgKiBAb2Zmc2V0OiB0aGUgb2Zmc2V0IG9mIHRoZSBtZW1vcnkgaW5zaWRlIHBhZ2UKPiA+ID4g
PiA+ID4gPiArICogQGxlbmd0aDogbWVtb3J5IGxlbmd0aAo+ID4gPiA+ID4gPiA+ICsgKiBAZGly
OiBETUEgZGlyZWN0aW9uCj4gPiA+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiA+ID4gKyAqIFRoaXMg
QVBJIGlzIG9ubHkgZm9yIHByZS1tYXBwZWQgYnVmZmVycywgZm9yIG5vbiBwcmVtYXBwZWQgYnVm
ZmVycyB2aXJ0aW8KPiA+ID4gPiA+ID4gPiArICogY29yZSBoYW5kbGVzIERNQSBBUEkgaW50ZXJu
YWxseS4KPiA+ID4gPiA+ID4gPiArICoKPiA+ID4gPiA+ID4gPiArICogUmV0dXJucyB0aGUgRE1B
IGFkZHIuIERNQV9NQVBQSU5HX0VSUk9SIG1lYW5zIGVycm9yLgo+ID4gPiA+ID4gPiA+ICsgKi8K
PiA+ID4gPiA+ID4gPiArZG1hX2FkZHJfdCB2aXJ0aW9fZG1hX21hcF9wYWdlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsIHNpemVfdCBvZmZzZXQsCj4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZW5ndGgsIGVudW0g
ZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBUaGlzIChhbmQgdGhlIHJlc2V0KSBuZWVkcyB0byBiZSBkb25lIHBlciB2aXJ0cXVl
dWUgaW5zdGVhZCBwZXIgZGV2aWNlCj4gPiA+ID4gPiA+IGFmdGVyIGIwZTUwNGU1NTA1ZDE4NGIw
YmUyNDhiN2RjZGJlNTBiNzlmMDM3NTggKCJ2aXJ0aW9fcmluZzogcGVyCj4gPiA+ID4gPiA+IHZp
cnRxdWV1ZSBkbWEgZGV2aWNlIikuCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFlFUy4K
PiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICsgICAgICAgc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYgPSBkZXZfdG9fdmlydGlvKGRldik7Cj4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKCF2cmluZ191c2VfZG1hX2FwaSh2ZGV2KSkK
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHBhZ2VfdG9fcGh5cyhwYWdlKSAr
IG9mZnNldDsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gZG1h
X21hcF9wYWdlKHZkZXYtPmRldi5wYXJlbnQsIHBhZ2UsIG9mZnNldCwgbGVuZ3RoLCBkaXIpOwo+
ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE5lZWQgZWl0aGVyIGlubGlu
ZSBvciBFWFBPUlRfU1lNQk9MX0dQTCgpIGhlcmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQmVjYXVz
ZSBJIGRpZCBub3QgdXNlIHRoaXMgaW50ZXJmYWNlLCBJIGRpZCBub3QgIGV4cG9ydCBpdC4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gPiA+ICsvKioKPiA+ID4gPiA+ID4gPiArICogdmlydGlvX2RtYV9tYXAgLSBn
ZXQgdGhlIERNQSBhZGRyIG9mIHRoZSBtZW1vcnkgZm9yIHZpcnRpbyBkZXZpY2UKPiA+ID4gPiA+
ID4gPiArICogQGRldjogdmlydGlvIGRldmljZQo+ID4gPiA+ID4gPiA+ICsgKiBAYWRkcjogdGhl
IGFkZHIgdG8gRE1BCj4gPiA+ID4gPiA+ID4gKyAqIEBsZW5ndGg6IG1lbW9yeSBsZW5ndGgKPiA+
ID4gPiA+ID4gPiArICogQGRpcjogRE1BIGRpcmVjdGlvbgo+ID4gPiA+ID4gPiA+ICsgKgo+ID4g
PiA+ID4gPiA+ICsgKiBUaGlzIEFQSSBpcyBvbmx5IGZvciBwcmUtbWFwcGVkIGJ1ZmZlcnMsIGZv
ciBub24gcHJlbWFwcGVkIGJ1ZmZlcnMgdmlydGlvCj4gPiA+ID4gPiA+ID4gKyAqIGNvcmUgaGFu
ZGxlcyBETUEgQVBJIGludGVybmFsbHkuCj4gPiA+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiA+ID4g
KyAqIFJldHVybnMgdGhlIERNQSBhZGRyLgo+ID4gPiA+ID4gPiA+ICsgKi8KPiA+ID4gPiA+ID4g
PiArZG1hX2FkZHJfdCB2aXJ0aW9fZG1hX21hcChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmFk
ZHIsIHVuc2lnbmVkIGludCBsZW5ndGgsCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCj4gPiA+ID4gPiA+ID4gK3sKPiA+
ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBwYWdlICpwYWdlOwo+ID4gPiA+ID4gPiA+ICsgICAg
ICAgc2l6ZV90IG9mZnNldDsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICBw
YWdlID0gdmlydF90b19wYWdlKGFkZHIpOwo+ID4gPiA+ID4gPiA+ICsgICAgICAgb2Zmc2V0ID0g
b2Zmc2V0X2luX3BhZ2UoYWRkcik7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAg
ICAgcmV0dXJuIHZpcnRpb19kbWFfbWFwX3BhZ2UoZGV2LCBwYWdlLCBvZmZzZXQsIGxlbmd0aCwg
ZGlyKTsKPiA+ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh2
aXJ0aW9fZG1hX21hcCk7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsvKioKPiA+ID4g
PiA+ID4gPiArICogdmlydGlvX2RtYV9tYXBwaW5nX2Vycm9yIC0gY2hlY2sgZG1hIGFkZHJlc3MK
PiA+ID4gPiA+ID4gPiArICogQGRldjogdmlydGlvIGRldmljZQo+ID4gPiA+ID4gPiA+ICsgKiBA
YWRkcjogRE1BIGFkZHJlc3MKPiA+ID4gPiA+ID4gPiArICoKPiA+ID4gPiA+ID4gPiArICogVGhp
cyBBUEkgaXMgb25seSBmb3IgcHJlLW1hcHBlZCBidWZmZXJzLCBmb3Igbm9uIHByZW1hcHBlZCBi
dWZmZXJzIHZpcnRpbwo+ID4gPiA+ID4gPiA+ICsgKiBjb3JlIGhhbmRsZXMgRE1BIEFQSSBpbnRl
cm5hbGx5Lgo+ID4gPiA+ID4gPiA+ICsgKgo+ID4gPiA+ID4gPiA+ICsgKiBSZXR1cm5zIDAgbWVh
bnMgZG1hIHZhbGlkLiBPdGhlciBtZWFucyBpbnZhbGlkIGRtYSBhZGRyZXNzLgo+ID4gPiA+ID4g
PiA+ICsgKi8KPiA+ID4gPiA+ID4gPiAraW50IHZpcnRpb19kbWFfbWFwcGluZ19lcnJvcihzdHJ1
Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgYWRkcikKPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+
ID4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYgPSBkZXZfdG9fdmlydGlv
KGRldik7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKCF2cmluZ191
c2VfZG1hX2FwaSh2ZGV2KSkKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIGRtYV9tYXBwaW5n
X2Vycm9yKHZkZXYtPmRldi5wYXJlbnQsIGFkZHIpOwo+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4g
PiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHZpcnRpb19kbWFfbWFwcGluZ19lcnJvcik7Cj4gPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsvKioKPiA+ID4gPiA+ID4gPiArICogdmlydGlvX2Rt
YV91bm1hcCAtIHVubWFwIERNQSBhZGRyCj4gPiA+ID4gPiA+ID4gKyAqIEBkZXY6IHZpcnRpbyBk
ZXZpY2UKPiA+ID4gPiA+ID4gPiArICogQGRtYTogRE1BIGFkZHJlc3MKPiA+ID4gPiA+ID4gPiAr
ICogQGxlbmd0aDogbWVtb3J5IGxlbmd0aAo+ID4gPiA+ID4gPiA+ICsgKiBAZGlyOiBETUEgZGly
ZWN0aW9uCj4gPiA+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiA+ID4gKyAqIFRoaXMgQVBJIGlzIG9u
bHkgZm9yIHByZS1tYXBwZWQgYnVmZmVycywgZm9yIG5vbiBwcmVtYXBwZWQgYnVmZmVycyB2aXJ0
aW8KPiA+ID4gPiA+ID4gPiArICogY29yZSBoYW5kbGVzIERNQSBBUEkgaW50ZXJuYWxseS4KPiA+
ID4gPiA+ID4gPiArICovCj4gPiA+ID4gPiA+ID4gK3ZvaWQgdmlydGlvX2RtYV91bm1hcChzdHJ1
Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgZG1hLCB1bnNpZ25lZCBpbnQgbGVuZ3RoLAo+ID4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIpCj4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0aW9f
ZGV2aWNlICp2ZGV2ID0gZGV2X3RvX3ZpcnRpbyhkZXYpOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gPiArICAgICAgIGlmICghdnJpbmdfdXNlX2RtYV9hcGkodmRldikpCj4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4g
KyAgICAgICBkbWFfdW5tYXBfcGFnZSh2ZGV2LT5kZXYucGFyZW50LCBkbWEsIGxlbmd0aCwgZGly
KTsKPiA+ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh2aXJ0
aW9fZG1hX3VubWFwKTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gIE1PRFVMRV9MSUNF
TlNFKCJHUEwiKTsKPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0
aW8uaCBiL2luY2x1ZGUvbGludXgvdmlydGlvLmgKPiA+ID4gPiA+ID4gPiBpbmRleCAzZWJiMzQ2
ZWJiN2MuLmI1ZmE3MTQ3NjczNyAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L3ZpcnRpby5oCj4gPiA+ID4gPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW8uaAo+
ID4gPiA+ID4gPiA+IEBAIC05LDYgKzksNyBAQAo+ID4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGlu
dXgvZGV2aWNlLmg+Cj4gPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFi
bGUuaD4KPiA+ID4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2dmcC5oPgo+ID4gPiA+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ICAvKioKPiA+ID4gPiA+ID4gPiAgICogc3RydWN0IHZpcnRxdWV1ZSAtIGEgcXVldWUgdG8g
cmVnaXN0ZXIgYnVmZmVycyBmb3Igc2VuZGluZyBvciByZWNlaXZpbmcuCj4gPiA+ID4gPiA+ID4g
QEAgLTIxNiw0ICsyMTcsMTIgQEAgdm9pZCB1bnJlZ2lzdGVyX3ZpcnRpb19kcml2ZXIoc3RydWN0
IHZpcnRpb19kcml2ZXIgKmRydik7Cj4gPiA+ID4gPiA+ID4gICNkZWZpbmUgbW9kdWxlX3ZpcnRp
b19kcml2ZXIoX192aXJ0aW9fZHJpdmVyKSBcCj4gPiA+ID4gPiA+ID4gICAgICAgICBtb2R1bGVf
ZHJpdmVyKF9fdmlydGlvX2RyaXZlciwgcmVnaXN0ZXJfdmlydGlvX2RyaXZlciwgXAo+ID4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHVucmVnaXN0ZXJfdmlydGlvX2RyaXZlcikK
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK2RtYV9hZGRyX3QgdmlydGlvX2RtYV9tYXBf
cGFnZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0
LAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgbGVuZ3RoLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpOwo+ID4gPiA+ID4gPiA+ICtk
bWFfYWRkcl90IHZpcnRpb19kbWFfbWFwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqYWRkciwg
dW5zaWduZWQgaW50IGxlbmd0aCwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcik7Cj4gPiA+ID4gPiA+ID4gK2ludCB2aXJ0
aW9fZG1hX21hcHBpbmdfZXJyb3Ioc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGFkZHIp
Owo+ID4gPiA+ID4gPiA+ICt2b2lkIHZpcnRpb19kbWFfdW5tYXAoc3RydWN0IGRldmljZSAqZGV2
LCBkbWFfYWRkcl90IGRtYSwgdW5zaWduZWQgaW50IGxlbmd0aCwKPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKTsKPiA+ID4gPiA+
ID4gPiAgI2VuZGlmIC8qIF9MSU5VWF9WSVJUSU9fSCAqLwo+ID4gPiA+ID4gPiA+IC0tCj4gPiA+
ID4gPiA+ID4gMi4zMi4wLjMuZzAxMTk1Y2Y5Zgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPgo+ID4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+IFZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdAo+ID4gPiBWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ID4gPiBodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbgo+ID4K
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
