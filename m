Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB115C7CB
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 17:23:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A540F86762;
	Thu, 13 Feb 2020 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13izIXO8WH13; Thu, 13 Feb 2020 16:23:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7840D84770;
	Thu, 13 Feb 2020 16:23:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50C84C0177;
	Thu, 13 Feb 2020 16:23:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E044C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 08E03860F8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGg8cCCB05lb
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:23:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B5987860EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:23:30 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j2HGw-0000Pf-Tt; Thu, 13 Feb 2020 16:23:27 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j2HGu-0006m0-Mt; Thu, 13 Feb 2020 16:23:26 +0000
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Dumazet <eric.dumazet@gmail.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
 <94fb9656-99ee-a001-e428-9d76c3620e61@gmail.com>
 <20200213105010-mutt-send-email-mst@kernel.org>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <35510da7-08f1-4aa5-c6d6-6bffbccaee0c@cambridgegreys.com>
Date: Thu, 13 Feb 2020 16:23:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213105010-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
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

Ck9uIDEzLzAyLzIwMjAgMTU6NTMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBUaHUs
IEZlYiAxMywgMjAyMCBhdCAwNzo0NDowNkFNIC0wODAwLCBFcmljIER1bWF6ZXQgd3JvdGU6Cj4+
Cj4+IE9uIDIvMTMvMjAgMjowMCBBTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4gT24g
V2VkLCBGZWIgMTIsIDIwMjAgYXQgMDU6Mzg6MDlQTSArMDAwMCwgQW50b24gSXZhbm92IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gT24gMTEvMDIvMjAyMCAxMDozNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+Pj4+PiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCAwNzo0MjozN0FNICswMDAwLCBBbnRvbiBJ
dmFub3Ygd3JvdGU6Cj4+Pj4+PiBPbiAxMS8wMi8yMDIwIDAyOjUxLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+Pj4+IE9uIDIwMjAvMi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAwOS8xMi8yMDE5IDEwOjQ4LCBhbnRvbi5pdmFub3ZAY2FtYnJp
ZGdlZ3JleXMuY29tIHdyb3RlOgo+Pj4+Pj4+Pj4gRnJvbTogQW50b24gSXZhbm92IDxhbnRvbi5p
dmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tPgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFNvbWUgb2YgdGhl
IGZyYW1lcyBtYXJrZWQgYXMgR1NPIHdoaWNoIGFycml2ZSBhdAo+Pj4+Pj4+Pj4gdmlydGlvX25l
dF9oZHJfZnJvbV9za2IoKSBoYXZlIG5vIEdTT19UWVBFLCBubwo+Pj4+Pj4+Pj4gZnJhZ21lbnRz
IChkYXRhX2xlbiA9IDApIGFuZCBsZW5ndGggc2lnbmlmaWNhbnRseSBzaG9ydGVyCj4+Pj4+Pj4+
PiB0aGFuIHRoZSBNVFUgKDc1MiBpbiBteSBleHBlcmltZW50cykuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4gVGhpcyBpcyBvYnNlcnZlZCBvbiByYXcgc29ja2V0cyByZWFkaW5nIG9mZiB2RXRoIGludGVy
ZmFjZXMKPj4+Pj4+Pj4+IGluIGFsbCA0LnggYW5kIDUueCBrZXJuZWxzIEkgdGVzdGVkLgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+IFRoZXNlIGZyYW1lcyBhcmUgcmVwb3J0ZWQgYXMgaW52YWxpZCB3aGls
ZSB0aGV5IGFyZSBpbiBmYWN0Cj4+Pj4+Pj4+PiBnc28tbGVzcyBmcmFtZXMuCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gVGhpcyBwYXRjaCBtYXJrcyB0aGUgdm5ldCBoZWFkZXIgYXMgbm8tR1NPIGZvciB0
aGVtIGluc3RlYWQKPj4+Pj4+Pj4+IG9mIHJlcG9ydGluZyBpdCBhcyBpbnZhbGlkLgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNh
bWJyaWRnZWdyZXlzLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4gICDCoCBpbmNsdWRlL2xp
bnV4L3ZpcnRpb19uZXQuaCB8IDggKysrKysrLS0KPj4+Pj4+Pj4+ICAgwqAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNsdWRlL2xpbnV4L3Zp
cnRpb19uZXQuaAo+Pj4+Pj4+Pj4gaW5kZXggMGQxZmU5Mjk3YWM2Li5kOTBkNWNmZjFiOWEgMTAw
NjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+Pj4+Pj4+Pj4g
KysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4+Pj4+IEBAIC0xMTIsOCArMTEy
LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50Cj4+Pj4+Pj4+PiB2aXJ0aW9fbmV0X2hkcl9mcm9tX3Nr
Yihjb25zdCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+Pj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RDUFY0Owo+Pj4+
Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoc2luZm8tPmdzb190eXBlICYgU0tC
X0dTT19UQ1BWNikKPj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5n
c29fdHlwZSA9IFZJUlRJT19ORVRfSERSX0dTT19UQ1BWNjsKPj4+Pj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBlbHNlCj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZB
TDsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlIHsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChza2ItPmRhdGFfbGVuID09IDApCj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09f
Tk9ORTsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNpbmZv
LT5nc29fdHlwZSAmIFNLQl9HU09fVENQX0VDTikKPj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSB8PSBWSVJUSU9fTkVUX0hEUl9HU09fRUNOOwo+Pj4+
Pj4+Pj4gICDCoMKgwqDCoMKgIH0gZWxzZQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4gcGluZy4KPj4+Pj4+
Pj4KPj4+Pj4+PiBEbyB5b3UgbWVhbiBnc29fc2l6ZSBpcyBzZXQgYnV0IGdzb190eXBlIGlzIG5v
dD8gTG9va3MgbGlrZSBhIGJ1Zwo+Pj4+Pj4+IGVsc2V3aGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFRo
YW5rcwo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+IFllcy4KPj4+Pj4+Cj4+Pj4+PiBJIGNvdWxkIG5v
dCB0cmFjZSBpdCB3aGVyZSBpdCBpcyBjb21pbmcgZnJvbS4KPj4+Pj4+Cj4+Pj4+PiBJIHNlZSBp
dCB3aGVuIGRvaW5nIHJlY3ZtbXNnIG9uIHJhdyBzb2NrZXRzIGluIHRoZSBVTUwgdmVjdG9yIG5l
dHdvcmsKPj4+Pj4+IGRyaXZlcnMuCj4+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHdlIG5lZWQgdG8gZmlu
ZCB0aGUgY3VscHJpdCBhbmQgZml4IGl0IHRoZXJlLCBsb3RzIG9mIG90aGVyIHRoaW5ncwo+Pj4+
PiBjYW4gYnJlYWsgb3RoZXJ3aXNlLgo+Pj4+PiBKdXN0IHByaW50aW5nIG91dCBza2ItPmRldi0+
bmFtZSBzaG91bGQgZG8gdGhlIHRyaWNrLCBubz8KPj4+PiBUaGUgcHJpbnRrIGluIHZpcnRpb19u
ZXRfaGRyX2Zyb21fc2tiIHNheXMgTlVMTC4KPj4+Pgo+Pj4+IFRoYXQgaXMgcHJvYmFibHkgbm9y
bWFsIGZvciBhIGxvY2FsbHkgb3JpZ2luYXRlZCBmcmFtZS4KPj4+Pgo+Pj4+IEkgY2Fubm90IHJl
cHJvZHVjZSB0aGlzIHdpdGggbmV0d29yayB0cmFmZmljIGJ5IHRoZSB3YXkgLSBpdCBoYXBwZW5z
IG9ubHkgaWYgdGhlIHRyYWZmaWMgaXMgbG9jYWxseSBvcmlnaW5hdGVkIG9uIHRoZSBob3N0Lgo+
Pj4+Cj4+Pj4gQSwKPj4+IE9LIHNvIGlzIGl0IGNvZGUgaW4gX190Y3BfdHJhbnNtaXRfc2tiIHRo
YXQgc2V0cyBnc29fc2l6ZSB0byBub24tbnVsbAo+Pj4gd2hlbiBnc29fdHlwZSBpcyAwPwo+Pj4K
Pj4gQ29ycmVjdCB3YXkgdG8gZGV0ZXJtaW5lIGlmIGEgcGFja2V0IGlzIGEgZ3NvIG9uZSBpcyBi
eSBsb29raW5nIGF0IGdzb19zaXplLgo+PiBUaGVuIG9ubHkgaXQgaXMgbGVnYWwgbG9va2luZyBh
dCBnc29fdHlwZQo+Pgo+Pgo+PiBzdGF0aWMgaW5saW5lIGJvb2wgc2tiX2lzX2dzbyhjb25zdCBz
dHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+PiB7Cj4+ICAgICAgcmV0dXJuIHNrYl9zaGluZm8oc2tiKS0+
Z3NvX3NpemU7Cj4+IH0KPj4KPj4gLyogTm90ZTogU2hvdWxkIGJlIGNhbGxlZCBvbmx5IGlmIHNr
Yl9pc19nc28oc2tiKSBpcyB0cnVlICovCj4+IHN0YXRpYyBpbmxpbmUgYm9vbCBza2JfaXNfZ3Nv
X3Y2KGNvbnN0IHN0cnVjdCBza19idWZmICpza2IpCj4+IC4uLgo+Pgo+Pgo+PiBUaGVyZSBpcyBh
YnNvbHV0ZWx5IG5vIHJlbGF0aW9uIGJldHdlZW4gR1NPIGFuZCBza2ItPmRhdGFfbGVuLCBza2Ig
Y2FuIGJlIGxpbmVhcml6ZWQKPj4gZm9yIHZhcmlvdXMgb3J0aG9nb25hbCByZWFzb25zLgo+IFRo
ZSByZXBvcnRlZCBwcm9ibGVtIGlzIHRoYXQgdmlydGlvIGdldHMgYSBwYWNrZXQgd2hlcmUgZ3Nv
X3NpemUKPiBpcyAhMCBidXQgZ3NvX3R5cGUgaXMgMC4KPgo+IEl0IGN1cnJlbnRseSBkcm9wcyB0
aGVzZSBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IGl0J3Mgc29tZSB0eXBlCj4gb2YgYSBnc28gcGFj
a2V0IGl0IGRvZXMgbm90IGtub3cgaG93IHRvIGhhbmRsZS4KPgo+Cj4gU28geW91IGFyZSBzYXlp
bmcgaWYgc2tiX2lzX2dzbyB3ZSBjYW4gc3RpbGwgaGF2ZSBnc29fdHlwZSBzZXQgdG8gMCwKPiBh
bmQgdGhhdCdzIGFuIGV4cGVjdGVkIGNvbmZpZ3VyYXRpb24/Cj4KPiBTbyB0aGUgcGF0Y2ggc2hv
dWxkIGp1c3QgYmU6Cj4KPgo+IC0gICAgICAgIGlmIChza2JfaXNfZ3NvKHNrYikpIHsKPiArICAg
ICAgICBpZiAoc2tiX2lzX2dzbyhza2IpICYmIHNpbmZvLT5nc29fdHlwZSkgewo+ClllcywgcHJv
dmlkZWQgdGhhdCBza2JfaXNfZ3NvKHNrYikgYW5kIHNpbmZvLT5nc29fdHlwZSA9PSAwIGlzIGEg
dmFsaWQgc3RhdGUuCgpJIGFncmVlIHdpdGggSmFzb24sIHRoZXJlIG1heSBiZSBzb21ldGhpbmcg
d3JvbmcgZ29pbmcgb24gaGVyZSBhbmQgd2UgbmVlZCB0byBmaW5kIHRoZSBzb3VyY2Ugd2hpY2gg
Y3JlYXRlcyB0aGVzZSBwYWNrZXRzLgoKQS4KCj4KPiA/Cj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtdW0gbWFpbGluZyBsaXN0Cj4g
bGludXgtdW1AbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtdW0KCi0tIApBbnRvbiBSLiBJdmFub3YKQ2FtYnJpZGdl
Z3JleXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kLiBDb21wYW55IE51bWJlciAxMDI3
MzY2MQpodHRwczovL3d3dy5jYW1icmlkZ2VncmV5cy5jb20vCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
