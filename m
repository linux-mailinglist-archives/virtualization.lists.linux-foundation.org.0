Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B26A7B7E
	for <lists.virtualization@lfdr.de>; Thu,  2 Mar 2023 07:46:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E0C61216;
	Thu,  2 Mar 2023 06:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E0C61216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLzrcqPRGevj; Thu,  2 Mar 2023 06:46:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 25AA361033;
	Thu,  2 Mar 2023 06:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25AA361033
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62F9CC008C;
	Thu,  2 Mar 2023 06:46:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBA7BC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 06:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C74E341A41
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 06:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74E341A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrxCWAG7PZ2s
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 06:46:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F9E419DC
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F9E419DC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Mar 2023 06:46:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VcwC03D_1677739576; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VcwC03D_1677739576) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 14:46:16 +0800
Message-ID: <1677739383.519527-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost 07/10] virtio_ring: add api virtio_dma_map() for
 advance dma
Date: Thu, 2 Mar 2023 14:43:03 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230214072704.126660-1-xuanzhuo@linux.alibaba.com>
 <20230214072704.126660-8-xuanzhuo@linux.alibaba.com>
 <CACGkMEs_jQd84LSC5F_at0+G_D=JnBWOJH71B5=RQFPYQKwtBg@mail.gmail.com>
 <1676876377.4263525-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvxyV9fAyN1L_vqRvQGzA5XnmhviVFKZdNJS6oKqGLpBA@mail.gmail.com>
 <1677582923.193659-3-xuanzhuo@linux.alibaba.com>
 <1677722698.850823-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEsMjn6-H2mLkP0gGZ-YFVPdnruLDykBqO00xecU8D7mQw@mail.gmail.com>
 <1677727282.6062915-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEsXp2wvLJ=DcrVcKDQZWs8djf+iFKaPsX2-xp3vZa0TvA@mail.gmail.com>
 <20230302005901-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230302005901-mutt-send-email-mst@kernel.org>
Cc: maciej.fijalkowski@intel.com, virtualization@lists.linux-foundation.org,
 bjorn@kernel.org, jonathan.lemon@gmail.com, magnus.karlsson@intel.com
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

T24gVGh1LCAyIE1hciAyMDIzIDAxOjA5OjA0IC0wNTAwLCAiTWljaGFlbCBTLiBUc2lya2luIiA8
bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+IE9uIFRodSwgTWFyIDAyLCAyMDIzIGF0IDExOjI2OjUz
QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDEx
OjI04oCvQU0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFRodSwgMiBNYXIgMjAyMyAxMTowNToyNiArMDgwMCwgSmFzb24gV2FuZyA8
amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBNYXIgMiwgMjAyMyBh
dCAxMDoyNOKAr0FNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3Rl
Ogo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFR1ZSwgMjggRmViIDIwMjMgMTk6MTU6MjMgKzA4MDAs
IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4gPiA+ID4g
PiBPbiBUdWUsIDIxIEZlYiAyMDIzIDA5OjUxOjA3ICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBNb24sIEZlYiAyMCwgMjAyMyBh
dCAzOjAyIFBNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgMjAgRmViIDIwMjMgMTM6Mzg6
MjQgKzA4MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+
ID4gPiA+ID4gPiBPbiBUdWUsIEZlYiAxNCwgMjAyMyBhdCAzOjI3IFBNIFh1YW4gWmh1byA8eHVh
bnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gQWRkZWQgdmlydGlvX2RtYV9tYXAoKSB0byBtYXAgRE1BIGFkZHJlc3Nl
cyBmb3IgdmlydHVhbCBtZW1vcnkgaW4KPiA+ID4gPiA+ID4gPiA+ID4gPiBhZHZhbmNlLiBUaGUg
cHVycG9zZSBpcyB0byBrZWVwIG1lbW9yeSBtYXBwZWQgYWNyb3NzIG11bHRpcGxlIGFkZC9nZXQK
PiA+ID4gPiA+ID4gPiA+ID4gPiBidWYgb3BlcmF0aW9ucy4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+ID4gSSB3b25kZXIgaWYgaW5zdGVhZCBvZiBleHBvcnRpbmcgaGVscGVycyBs
aWtlIHRoaXMsIGl0IG1pZ2h0IGJlIHNpbXBsZQo+ID4gPiA+ID4gPiA+ID4gPiB0byBqdXN0IGV4
cG9ydCBkbWFfZGV2IHRoZW4gdGhlIHVwcGVyIGxheWVyIGNhbiB1c2UgRE1BIEFQSSBhdCB3aWxs
Pwo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGUgcmVh
c29uIGZvciBub3QgZG9pbmcgdGhpcywgVmlydGlvIGlzIG5vdCBqdXN0IHVzaW5nIERNQV9ERVYg
dG8gbWFwcCwgYnV0Cj4gPiA+ID4gPiA+ID4gPiBhbHNvIGNoZWNrIHdoZXRoZXIgRE1BIGlzIHVz
ZWQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBXZSBzaG91bGQgbGV0IHRoZSBETUEgQVBJ
IGRlY2lkZSBieSBleHBvcnRpbmcgYSBjb3JyZWN0IGRtYV9kZXYuIEUuZwo+ID4gPiA+ID4gPiA+
IHdoZW4gQUNDRVNTX1BMQVRGT1JNIGlzIG5vdCBuZWdvdGlhdGVkLCBhZHZlcnRpc2luZyBhIERN
QSBkZXYgd2l0aG91dAo+ID4gPiA+ID4gPiA+IGRtYV9vcHMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IERvIHlvdSBtZWFuIHdlIHByb3ZpZGUgdGhpcyBBUEk/Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IHZpcnRpb19nZXRfZG1hX2RldigpCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IElmIGl0IHJldHVybnMgTlVMTCwgdGhlIGNhbGxlciB3aWxsIHVzZSB0aGUgcGh5c2ljYWwg
bWVtb3J5IGFkZHJlc3MgZGlyZWN0bHkuIElmCj4gPiA+ID4gPiA+IHRoaXMgZnVuYyByZXR1cm4g
YSBkbWFfZGV2LCB0aGUgY2FsbGVyIHNob3VsZCB1c2UgRE1BIEFQSS4KPiA+ID4gPiA+Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gY2MgdGhlIFhEUF9TT0NLRVQncyBtYWludGFpbmVycy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBGaXJzdCBvZiBhbGwsIEphc29uIGRvZXMgbm90IHdhbnQgdG8gZW5jYXBzdWxh
dGUgdGhlIEFQSSBvZiBETUEgYnkgVmlydGlvLiBJdCBpcwo+ID4gPiA+ID4gYmVzdCB0byBwYXNz
IERNQSBEZXZpY2UgdG8gWFNLLCBYU0sgdXNlcyBETUEgQVBJIGZvciBETUEgTUFQIG9wZXJhdGlv
biBkaXJlY3RseS4KPiA+ID4gPiA+IEkgYWdyZWUgd2l0aCB0aGlzIGlkZWEuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gSG93ZXZlciwgdGhlcmUgYXJlIHNldmVyYWwgcHJvYmxlbXMgdW5kZXIgVmlydGlv
Ogo+ID4gPiA+ID4gMS4gSW4gc29tZSB2aXJ0dWFsaXphdGlvbiBzY2VuYXJpb3MsIHdlIGRvIG5v
dCBoYXZlIHRvIHBlcmZvcm0gRE1BIG9wZXJhdGlvbnMsCj4gPiA+ID4gPiAgICBqdXN0IHVzZSB0
aGUgcGh5c2ljYWwgYWRkcmVzcyBkaXJlY3RseS4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgbm90
IGEgcHJvYmxlbSwgd2UgY2FuIHNpbXBseSByZXR1cm4gdGhlIHZpcnRpbyBkZXZpY2UgaXRzZWxm
Cj4gPiA+ID4gYXMgdGhlIERNQSBkZXZpY2UgaW4gdGhpcyBjYXNlLiBTaW5jZSB0aGVyZSdzIG5v
IERNQSBvcHMgYXR0YWNoZWQsIERNQQo+ID4gPiA+IEFQSSB3aWxsIHVzZSBwaHlzaWNhbCBhZGRy
ZXNzIGluIHRoaXMgY2FzZS4KPiA+ID4KPiA+ID4gSXMgdGhpcyBsaWtlIHRoaXM/IFNvIHdoeSBk
byB3ZSBoYXZlIHRvIGRlYWwgd2l0aCBpdCBpbiBWaXJ0aW8gUmluZz8gTGV0IG1lCj4gPiA+IGxl
YXJuIGl0Lgo+ID4KPiA+IEl0IGhhcyBhIGxvbmcgZGViYXRlIGFuZCBJIGNhbid0IHJlY2FsbCB0
b28gbWFueSBkZXRhaWxzLiAoWW91IGNhbgo+ID4gc2VhcmNoIHRoZSBhcmNoaXZlcykuIE1pY2hh
ZWwgbWF5IHNob3cgbW9yZSB0aG91Z2h0cyBoZXJlLgo+ID4KPiA+IE9uZSBjb25jZXJuIGlzIHRo
ZSBvdmVyaGVhZCBvZiB0aGUgRE1BIEFQSSB0aGF0IG5lZWRzIHRvIGJlIGJlbmNobWFya2VkLgo+
ID4KPiA+IFRoYW5rcwo+Cj4gQ29uY2VybiB3aXRoIHdoYXQ/IFRoaXMgcGF0Y2ggZG9lcyBub3Qg
Y2hhbmdlIGRldmljZXMsIHRoZXkgYXJlIHVzaW5nCj4gdGhlIGV4aXN0aW5nIEFQSS4gWHVhbiBa
aHVvIGFscmVhZHkgc2hvd2VkIGEgYmVuY2htYXJrIHJlc3VsdCBmb3IgQUZfWERQLgo+Cj4KPiA+
ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gMi4gVGhlIGxhdGVzdCBWaXJ0aW8gQ29yZSBzdXBw
b3J0cyBlYWNoIHJ4L3R4IHF1ZXVlIHdpdGggb25lIERNQSBkZXZpY2UuCj4gPiA+ID4gPiAgICBH
ZW5lcmFsbHksIHRoZSBwaHlzaWNhbCBuZXR3b3JrIGNhcmQgaGFzIG9ubHkgb25lIGRldmljZS4g
QWxsIHF1ZXVlcyB1c2UKPiA+ID4gPiA+ICAgIGl0IGZvciBETUEgb3BlcmF0aW9uLgo+ID4gPiA+
Cj4gPiA+ID4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgYSBiaWcgZGVhbCwgd2UganVzdCBuZWVkIHRv
IHVzZSB0aGUgcGVyIHZpcnRxdWV1ZQo+ID4gPiA+IGRtYSBkZXZpY2UgdG8gdXNlIERNQSBBUEku
Cj4gPiA+Cj4gPiA+IFllcy4KPiA+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFNvIEkgY29uc2lkZXIgdGhpcyBwcm9ibGVtIGFnYWluLCBWaXJ0aW8gQ29yZSBwcm92aWRlcyBv
bmx5IG9uZSBBUEkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gKiB2aXJ0aW9fZ2V0X2RtYV9kZXYocXVl
dWUpCj4gPiA+ID4gPgo+ID4gPiA+ID4gSWYgdGhlIHJldHVybiB2YWx1ZSBpcyBOVUxMLCBpdCBt
ZWFucyB0aGF0IHRoZXJlIGlzIG5vIERNQSBvcGVyYXRpb24uIElmIGl0IGlzCj4gPiA+ID4gPiBu
b3QgTlVMTCwgdXNlIERNQSBBUEkgZm9yIERNQSBvcGVyYXRpb24uCj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhlIG1vZGlmaWNhdGlvbiBvZiBYU0sgaXMgbGlrZSB0aGlzLiBXZSBtYXkgcGFzcyBOVUxM
IGFzIGRldiB0byB4cF9kbWFfbWFwKCkuCj4gPiA+ID4gPiBJZiBkZXYgaXMgTlVMTCwgdGhlbiB0
aGVyZSBpcyBubyBuZWVkIHRvIHBlcmZvcm0gRE1BIGFuZCBTeW5jIG9wZXJhdGlvbnMuCj4gPiA+
ID4gPiBPdGhlcndpc2UsIGl0IHdpbGwgcGVyZm9ybSBETUEgb3BlcmF0aW9ucyBsaWtlIG90aGVy
IGRldmljZXMuCj4gPiA+ID4KPiA+ID4gPiBBcyBkaXNjdXNzZWQgYWJvdmUsIGl0IG1pZ2h0IGJl
IGVhc2llcjoKPiA+ID4gPgo+ID4gPiA+ICAgICBpZiAoIXZpcnRpb19oYXNfZmVhdHVyZShWSVJU
SU9fRl9BQ0NFU1NfUExBVEZPUk0pKQo+ID4gPiA+ICAgICAgICAgcmV0dXJuIHZpcnRpb19kZXZp
Y2U7Cj4gPiA+ID4gICAgIGVsc2UKPiA+ID4gPiAgICAgICAgIHJldHVybiB2cmluZ19kbWFfZGV2
KCk7Cj4gPiA+Cj4gPiA+IFllcywgYWNjb3JkaW5nIHRvIEphc29uJ3Mgb3BpbmlvbiwgdGhlbiBY
U0sgbm90IG5lZWQgdG8gZG8gYW55IG1vZGlmaWNhdGlvbnMuCj4gPiA+Cj4gPiA+IFRoYW5rcy4K
Pgo+IFllcyBBRl9YRFAgZG9lcyBub3QgbmVlZCB0aGUgcGVyIFZRIGRldmljZSBoYWNrLgo+IFdl
IHNob3VsZCBwcm9iYWJseSByZXRoaW5rIGl0Lgo+Cj4gQnV0IGFzIGZhciBhcyBpbXBsZW1lbnRh
dGlvbiBnb2VzLCBwb2tpbmcgYXQgVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JNCj4gaXMgd3Jvbmcu
IFBsZWFzZSB1c2UgdmlydGlvX2hhc19kbWFfcXVpcmsuCgpJIHRoaW5rIHRoZSBjb2RlIHNob3Vs
ZCBsaWtlIHRoaXM6Cgorc3RydWN0IGRldmljZSAqdmlydHF1ZXVlX2dldF9kbWFfZGV2KHN0cnVj
dCB2aXJ0cXVldWUgKl92cSkKK3sKKyAgICAgICBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSA9
IHRvX3Z2cShfdnEpOworCisgICAgICAgaWYgKCF2cS0+dXNlX2RtYV9hcGkpCisgICAgICAgICAg
ICAgICByZXR1cm4gJnZxLT52cS52ZGV2LT5kZXY7CisKKyAgICAgICByZXR1cm4gdnJpbmdfZG1h
X2Rldih2cSk7Cit9CitFWFBPUlRfU1lNQk9MX0dQTCh2aXJ0cXVldWVfZ2V0X2RtYV9kZXYpOwoK
VGhhbmtzLgoKCj4KPgo+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbmQgaWYgdGhlIGRt
YV9kZXYgb2YgcnggYW5kIHR4IGlzIGRpZmZlcmVudCwgdGhlbiB3ZSBjYW4gb25seSBkaXNhYmxl
Cj4gPiA+ID4gPiBYRFBfU09DS0VULgo+ID4gPiA+Cj4gPiA+ID4gV2UgY2FuIHN0YXJ0IHdpdGgg
dGhpcy4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcwo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
TG9va2luZyBmb3J3YXJkIHRvIGV2ZXJ5b25lJ3MgcmVwbHkuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
VGhhbmtzLgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhhbmtzLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gPiAoT3RoZXJ3aXNlIHRoZSBETUEgaGVscGVycyBuZWVkIHRvIGdy
b3cvc2hyaW5rIGFzIHRoZSBETUEgQVBJIGV2b2x2ZXM/KQo+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQWRkZWQgdmlydGlvX2RtYV91bm1h
cCgpIGZvciB1bm1hcCBETUEgYWRkcmVzcy4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFi
YS5jb20+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZl
cnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgfCA5MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ID4gPiA+ID4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC92aXJ0aW8uaCAgICAg
ICB8ICA5ICsrKysKPiA+ID4gPiA+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5z
ZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcmluZy5jCj4gPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggY2Q5MzY0ZWIyMzQ1Li44NTUzMzg2
MDljN2YgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmly
dGlvX3JpbmcuYwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19yaW5nLmMKPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzE3Miw0ICszMTcyLDk2IEBAIGNvbnN0
IHN0cnVjdCB2cmluZyAqdmlydHF1ZXVlX2dldF92cmluZyhzdHJ1Y3QgdmlydHF1ZXVlICp2cSkK
PiA+ID4gPiA+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+ICBFWFBPUlRfU1lNQk9M
X0dQTCh2aXJ0cXVldWVfZ2V0X3ZyaW5nKTsKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiA+ICsvKioKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogdmlydGlvX2RtYV9tYXBfcGFn
ZSAtIGdldCB0aGUgRE1BIGFkZHIgb2YgdGhlIG1lbW9yeSBmb3IgdmlydGlvIGRldmljZQo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgKiBAZGV2OiB2aXJ0aW8gZGV2aWNlCj4gPiA+ID4gPiA+ID4gPiA+
ID4gKyAqIEBwYWdlOiB0aGUgcGFnZSBvZiB0aGUgbWVtb3J5IHRvIERNQQo+ID4gPiA+ID4gPiA+
ID4gPiA+ICsgKiBAb2Zmc2V0OiB0aGUgb2Zmc2V0IG9mIHRoZSBtZW1vcnkgaW5zaWRlIHBhZ2UK
PiA+ID4gPiA+ID4gPiA+ID4gPiArICogQGxlbmd0aDogbWVtb3J5IGxlbmd0aAo+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgKiBAZGlyOiBETUEgZGlyZWN0aW9uCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAq
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAqIFRoaXMgQVBJIGlzIG9ubHkgZm9yIHByZS1tYXBwZWQg
YnVmZmVycywgZm9yIG5vbiBwcmVtYXBwZWQgYnVmZmVycyB2aXJ0aW8KPiA+ID4gPiA+ID4gPiA+
ID4gPiArICogY29yZSBoYW5kbGVzIERNQSBBUEkgaW50ZXJuYWxseS4KPiA+ID4gPiA+ID4gPiA+
ID4gPiArICoKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogUmV0dXJucyB0aGUgRE1BIGFkZHIuIERN
QV9NQVBQSU5HX0VSUk9SIG1lYW5zIGVycm9yLgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKi8KPiA+
ID4gPiA+ID4gPiA+ID4gPiArZG1hX2FkZHJfdCB2aXJ0aW9fZG1hX21hcF9wYWdlKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsIHNpemVfdCBvZmZzZXQsCj4gPiA+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZW5n
dGgsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKPiA+ID4gPiA+ID4gPiA+ID4gPiArewo+
ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIChhbmQgdGhlIHJlc2V0KSBu
ZWVkcyB0byBiZSBkb25lIHBlciB2aXJ0cXVldWUgaW5zdGVhZCBwZXIgZGV2aWNlCj4gPiA+ID4g
PiA+ID4gPiA+IGFmdGVyIGIwZTUwNGU1NTA1ZDE4NGIwYmUyNDhiN2RjZGJlNTBiNzlmMDM3NTgg
KCJ2aXJ0aW9fcmluZzogcGVyCj4gPiA+ID4gPiA+ID4gPiA+IHZpcnRxdWV1ZSBkbWEgZGV2aWNl
IikuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFlFUy4K
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYgPSBkZXZfdG9f
dmlydGlvKGRldik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgaWYgKCF2cmluZ191c2VfZG1hX2FwaSh2ZGV2KSkKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHBhZ2VfdG9fcGh5cyhwYWdlKSArIG9mZnNldDsKPiA+ID4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gZG1hX21h
cF9wYWdlKHZkZXYtPmRldi5wYXJlbnQsIHBhZ2UsIG9mZnNldCwgbGVuZ3RoLCBkaXIpOwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IE5l
ZWQgZWl0aGVyIGlubGluZSBvciBFWFBPUlRfU1lNQk9MX0dQTCgpIGhlcmUuCj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gQmVjYXVzZSBJIGRpZCBub3QgdXNlIHRoaXMgaW50ZXJmYWNl
LCBJIGRpZCBub3QgIGV4cG9ydCBpdC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBU
aGFua3MuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsvKioKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICogdmlydGlvX2RtYV9tYXAgLSBnZXQgdGhlIERNQSBhZGRyIG9mIHRo
ZSBtZW1vcnkgZm9yIHZpcnRpbyBkZXZpY2UKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogQGRldjog
dmlydGlvIGRldmljZQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKiBAYWRkcjogdGhlIGFkZHIgdG8g
RE1BCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAqIEBsZW5ndGg6IG1lbW9yeSBsZW5ndGgKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICogQGRpcjogRE1BIGRpcmVjdGlvbgo+ID4gPiA+ID4gPiA+ID4gPiA+
ICsgKgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKiBUaGlzIEFQSSBpcyBvbmx5IGZvciBwcmUtbWFw
cGVkIGJ1ZmZlcnMsIGZvciBub24gcHJlbWFwcGVkIGJ1ZmZlcnMgdmlydGlvCj4gPiA+ID4gPiA+
ID4gPiA+ID4gKyAqIGNvcmUgaGFuZGxlcyBETUEgQVBJIGludGVybmFsbHkuCj4gPiA+ID4gPiA+
ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAqIFJldHVybnMgdGhlIERNQSBhZGRy
Lgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKi8KPiA+ID4gPiA+ID4gPiA+ID4gPiArZG1hX2FkZHJf
dCB2aXJ0aW9fZG1hX21hcChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmFkZHIsIHVuc2lnbmVk
IGludCBsZW5ndGgsCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCj4gPiA+ID4gPiA+ID4gPiA+ID4gK3sKPiA+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBwYWdlICpwYWdlOwo+ID4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgc2l6ZV90IG9mZnNldDsKPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBwYWdlID0gdmlydF90b19wYWdlKGFkZHIpOwo+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgb2Zmc2V0ID0gb2Zmc2V0X2luX3BhZ2UoYWRkcik7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIHZpcnRp
b19kbWFfbWFwX3BhZ2UoZGV2LCBwYWdlLCBvZmZzZXQsIGxlbmd0aCwgZGlyKTsKPiA+ID4gPiA+
ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiA+ID4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh2aXJ0
aW9fZG1hX21hcCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsv
KioKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogdmlydGlvX2RtYV9tYXBwaW5nX2Vycm9yIC0gY2hl
Y2sgZG1hIGFkZHJlc3MKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogQGRldjogdmlydGlvIGRldmlj
ZQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKiBAYWRkcjogRE1BIGFkZHJlc3MKPiA+ID4gPiA+ID4g
PiA+ID4gPiArICoKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogVGhpcyBBUEkgaXMgb25seSBmb3Ig
cHJlLW1hcHBlZCBidWZmZXJzLCBmb3Igbm9uIHByZW1hcHBlZCBidWZmZXJzIHZpcnRpbwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgKiBjb3JlIGhhbmRsZXMgRE1BIEFQSSBpbnRlcm5hbGx5Lgo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgKgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKiBSZXR1cm5zIDAgbWVh
bnMgZG1hIHZhbGlkLiBPdGhlciBtZWFucyBpbnZhbGlkIGRtYSBhZGRyZXNzLgo+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgKi8KPiA+ID4gPiA+ID4gPiA+ID4gPiAraW50IHZpcnRpb19kbWFfbWFwcGlu
Z19lcnJvcihzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgYWRkcikKPiA+ID4gPiA+ID4g
PiA+ID4gPiArewo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYgPSBkZXZfdG9fdmlydGlvKGRldik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKCF2cmluZ191c2VfZG1hX2FwaSh2ZGV2KSkKPiA+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIGRtYV9tYXBwaW5nX2Vy
cm9yKHZkZXYtPmRldi5wYXJlbnQsIGFkZHIpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHZpcnRpb19kbWFfbWFwcGluZ19lcnJv
cik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsvKioKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICogdmlydGlvX2RtYV91bm1hcCAtIHVubWFwIERNQSBhZGRyCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAqIEBkZXY6IHZpcnRpbyBkZXZpY2UKPiA+ID4gPiA+ID4gPiA+ID4g
PiArICogQGRtYTogRE1BIGFkZHJlc3MKPiA+ID4gPiA+ID4gPiA+ID4gPiArICogQGxlbmd0aDog
bWVtb3J5IGxlbmd0aAo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgKiBAZGlyOiBETUEgZGlyZWN0aW9u
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAqIFRoaXMgQVBJ
IGlzIG9ubHkgZm9yIHByZS1tYXBwZWQgYnVmZmVycywgZm9yIG5vbiBwcmVtYXBwZWQgYnVmZmVy
cyB2aXJ0aW8KPiA+ID4gPiA+ID4gPiA+ID4gPiArICogY29yZSBoYW5kbGVzIERNQSBBUEkgaW50
ZXJuYWxseS4KPiA+ID4gPiA+ID4gPiA+ID4gPiArICovCj4gPiA+ID4gPiA+ID4gPiA+ID4gK3Zv
aWQgdmlydGlvX2RtYV91bm1hcChzdHJ1Y3QgZGV2aWNlICpkZXYsIGRtYV9hZGRyX3QgZG1hLCB1
bnNpZ25lZCBpbnQgbGVuZ3RoLAo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpCj4gPiA+ID4gPiA+ID4gPiA+ID4gK3sK
PiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2ID0g
ZGV2X3RvX3ZpcnRpbyhkZXYpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgIGlmICghdnJpbmdfdXNlX2RtYV9hcGkodmRldikpCj4gPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBkbWFfdW5tYXBfcGFnZSh2ZGV2LT5kZXYucGFyZW50LCBk
bWEsIGxlbmd0aCwgZGlyKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiA+ID4g
PiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh2aXJ0aW9fZG1hX3VubWFwKTsKPiA+ID4gPiA+ID4gPiA+
ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiA+ID4g
PiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW8uaCBiL2luY2x1
ZGUvbGludXgvdmlydGlvLmgKPiA+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCAzZWJiMzQ2ZWJiN2Mu
LmI1ZmE3MTQ3NjczNyAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L3ZpcnRpby5oCj4gPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0
aW8uaAo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC05LDYgKzksNyBAQAo+ID4gPiA+ID4gPiA+ID4g
PiA+ICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICNpbmNs
dWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiA+ID4gPiA+ID4gPiA+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L2dmcC5oPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZG1h
LW1hcHBpbmcuaD4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ICAvKioK
PiA+ID4gPiA+ID4gPiA+ID4gPiAgICogc3RydWN0IHZpcnRxdWV1ZSAtIGEgcXVldWUgdG8gcmVn
aXN0ZXIgYnVmZmVycyBmb3Igc2VuZGluZyBvciByZWNlaXZpbmcuCj4gPiA+ID4gPiA+ID4gPiA+
ID4gQEAgLTIxNiw0ICsyMTcsMTIgQEAgdm9pZCB1bnJlZ2lzdGVyX3ZpcnRpb19kcml2ZXIoc3Ry
dWN0IHZpcnRpb19kcml2ZXIgKmRydik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICNkZWZpbmUgbW9k
dWxlX3ZpcnRpb19kcml2ZXIoX192aXJ0aW9fZHJpdmVyKSBcCj4gPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICBtb2R1bGVfZHJpdmVyKF9fdmlydGlvX2RyaXZlciwgcmVnaXN0ZXJfdmlydGlvX2Ry
aXZlciwgXAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHVucmVn
aXN0ZXJfdmlydGlvX2RyaXZlcikKPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4g
PiA+ID4gK2RtYV9hZGRyX3QgdmlydGlvX2RtYV9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LAo+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGVuZ3RoLCBlbnVtIGRt
YV9kYXRhX2RpcmVjdGlvbiBkaXIpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICtkbWFfYWRkcl90IHZp
cnRpb19kbWFfbWFwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqYWRkciwgdW5zaWduZWQgaW50
IGxlbmd0aCwKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGVu
dW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gK2ludCB2aXJ0
aW9fZG1hX21hcHBpbmdfZXJyb3Ioc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGFkZHIp
Owo+ID4gPiA+ID4gPiA+ID4gPiA+ICt2b2lkIHZpcnRpb19kbWFfdW5tYXAoc3RydWN0IGRldmlj
ZSAqZGV2LCBkbWFfYWRkcl90IGRtYSwgdW5zaWduZWQgaW50IGxlbmd0aCwKPiA+ID4gPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGly
KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgI2VuZGlmIC8qIF9MSU5VWF9WSVJUSU9fSCAqLwo+ID4g
PiA+ID4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gMi4zMi4wLjMuZzAxMTk1Y2Y5
Zgo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPiA+ID4gPiA+IFZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdAo+
ID4gPiA+ID4gPiBWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ID4g
PiA+ID4gPiBodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
