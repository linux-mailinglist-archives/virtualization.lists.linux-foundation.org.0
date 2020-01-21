Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3863D1439B2
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 10:42:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B6AE2204CE;
	Tue, 21 Jan 2020 09:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jf03WdTPWN7G; Tue, 21 Jan 2020 09:41:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4297920363;
	Tue, 21 Jan 2020 09:41:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15E05C0174;
	Tue, 21 Jan 2020 09:41:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6284FC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4B274204AC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Myz4HEqi2i7W
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 92D5C20363
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579599707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTqvJDIcTrY113uWw5YXK41fhJwgqvlsVFz5t0ig+QY=;
 b=hZZVSc8KAIFScH8yXHeileAPvV2I5UF/B4tmQB8wgRGghXbkxTcLB6Eht3xkHB8g1r6HUw
 Ty8b15K2VMRSzF5Yz1ZOlJ9TgsJ34U/CS8ngn5l0Fd6cxgmi7SBj4WQ9iSzq2Mc5BCXNo5
 JJiJL8qE2cfi1PcFGu1MyTLKIg0ylqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Ao7DZCFKMUuELGaw65FIEw-1; Tue, 21 Jan 2020 04:41:43 -0500
X-MC-Unique: Ao7DZCFKMUuELGaw65FIEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B3618B639A;
 Tue, 21 Jan 2020 09:41:40 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6FFD19C6A;
 Tue, 21 Jan 2020 09:41:22 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73EBA4@SHSMSX104.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f27d59b7-1c91-5870-55f5-e21311fcef99@redhat.com>
Date: Tue, 21 Jan 2020 17:41:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D73EBA4@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8yMSDkuIvljYg0OjQwLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4gRnJvbTogSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDE3
LCAyMDIwIDExOjAzIEFNCj4+Cj4+Cj4+IE9uIDIwMjAvMS8xNiDkuIvljYgxMToyMiwgSmFzb24g
R3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMDg6NDI6MjlQTSAr
MDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiB2RFBBIGRldmljZSBpcyBhIGRldmljZSB0aGF0
IHVzZXMgYSBkYXRhcGF0aCB3aGljaCBjb21wbGllcyB3aXRoIHRoZQo+Pj4+IHZpcnRpbyBzcGVj
aWZpY2F0aW9ucyB3aXRoIHZlbmRvciBzcGVjaWZpYyBjb250cm9sIHBhdGguIHZEUEEgZGV2aWNl
cwo+Pj4+IGNhbiBiZSBib3RoIHBoeXNpY2FsbHkgbG9jYXRlZCBvbiB0aGUgaGFyZHdhcmUgb3Ig
ZW11bGF0ZWQgYnkKPj4+PiBzb2Z0d2FyZS4gdkRQQSBoYXJkd2FyZSBkZXZpY2VzIGFyZSB1c3Vh
bGx5IGltcGxlbWVudGVkIHRocm91Z2ggUENJRQo+Pj4+IHdpdGggdGhlIGZvbGxvd2luZyB0eXBl
czoKPj4+Pgo+Pj4+IC0gUEYgKFBoeXNpY2FsIEZ1bmN0aW9uKSAtIEEgc2luZ2xlIFBoeXNpY2Fs
IEZ1bmN0aW9uCj4+Pj4gLSBWRiAoVmlydHVhbCBGdW5jdGlvbikgLSBEZXZpY2UgdGhhdCBzdXBw
b3J0cyBzaW5nbGUgcm9vdCBJL08KPj4+PiAgICAgdmlydHVhbGl6YXRpb24gKFNSLUlPVikuIEl0
cyBWaXJ0dWFsIEZ1bmN0aW9uIChWRikgcmVwcmVzZW50cyBhCj4+Pj4gICAgIHZpcnR1YWxpemVk
IGluc3RhbmNlIG9mIHRoZSBkZXZpY2UgdGhhdCBjYW4gYmUgYXNzaWduZWQgdG8gZGlmZmVyZW50
Cj4+Pj4gICAgIHBhcnRpdGlvbnMKPj4+PiAtIFZERVYgKFZpcnR1YWwgRGV2aWNlKSAtIFdpdGgg
dGVjaG5vbG9naWVzIHN1Y2ggYXMgSW50ZWwgU2NhbGFibGUKPj4+PiAgICAgSU9WLCBhIHZpcnR1
YWwgZGV2aWNlIGNvbXBvc2VkIGJ5IGhvc3QgT1MgdXRpbGl6aW5nIG9uZSBvciBtb3JlCj4+Pj4g
ICAgIEFESXMuCj4gdGhlIGNvbmNlcHQgb2YgVkRFViBpbmNsdWRlcyBib3RoIHNvZnR3YXJlIGJp
dHMgYW5kIEFESXMuIElmIHlvdQo+IG9ubHkgdGFrZSBhYm91dCBoYXJkd2FyZSB0eXBlcywgdXNp
bmcgQURJIGlzIG1vcmUgYWNjdXJhdGUuCgoKT2suCgoKPgo+Pj4+IC0gU0YgKFN1YiBmdW5jdGlv
bikgLSBWZW5kb3Igc3BlY2lmaWMgaW50ZXJmYWNlIHRvIHNsaWNlIHRoZSBQaHlzaWNhbAo+Pj4+
ICAgICBGdW5jdGlvbiB0byBtdWx0aXBsZSBzdWIgZnVuY3Rpb25zIHRoYXQgY2FuIGJlIGFzc2ln
bmVkIHRvIGRpZmZlcmVudAo+Pj4+ICAgICBwYXJ0aXRpb25zIGFzIHZpcnR1YWwgZGV2aWNlcy4K
Pj4+IEkgcmVhbGx5IGhvcGUgd2UgZG9uJ3QgZW5kIHVwIHdpdGggdHdvIGRpZmZlcmVudCB3YXlz
IHRvIHNwZWxsIHRoaXMKPj4+IHNhbWUgdGhpbmcuCj4+Cj4+IEkgdGhpbmsgeW91IG1lYW50IEFE
SSB2cyBTRi4gSXQgbG9va3MgdG8gbWUgdGhhdCBBREkgaXMgbGltaXRlZCB0byB0aGUKPj4gc2Nv
cGUgb2Ygc2NhbGFibGUgSU9WIGJ1dCBTRiBub3QuCj4gQURJIGlzIGp1c3QgYSB0ZXJtIGZvciBt
aW5pbWFsbHkgYXNzaWduYWJsZSByZXNvdXJjZSBpbiBTY2FsYWJsZSBJT1YuCj4gJ2Fzc2lnbmFi
bGUnIGltcGxpZXMgc2V2ZXJhbCB0aGluZ3MsIGUuZy4gdGhlIHJlc291cmNlIGNhbiBiZSBpbmRl
cGVuZGVudGx5Cj4gbWFwcGVkIHRvL2FjY2Vzc2VkIGJ5IHVzZXIgc3BhY2Ugb3IgZ3Vlc3QsIERN
QXMgYmV0d2VlbiB0d28KPiBBRElzIGFyZSBpc29sYXRlZCwgb3BlcmF0aW5nIG9uZSBBREkgZG9l
c24ndCBhZmZlY3RpbmcgYW5vdGhlciBBREksCj4gZXRjLiAgSSdtIG5vdCBjbGVhciBhYm91dCAg
b3RoZXIgdmVuZG9yIHNwZWNpZmljIGludGVyZmFjZXMsIGJ1dCBzdXBwb3NpbmcKPiB0aGV5IG5l
ZWQgbWF0Y2ggdGhlIHNpbWlsYXIgcmVxdWlyZW1lbnRzLiBUaGVuIGRvIHdlIHJlYWxseSB3YW50
IHRvCj4gZGlmZmVyZW50aWF0ZSBBREkgdnMuIFNGPyBXaGF0IGFib3V0IG1lcmdpbmcgdGhlbSB3
aXRoIEFESSBhcyBqdXN0Cj4gb25lIGV4YW1wbGUgb2YgZmluZXItZ3JhaW5lZCBzbGljaW5nPwoK
CkkgdGhpbmsgc28uIFRoYXQgd2hhdCBKYXNvbiBHIHdhbnQgYXMgd2VsbC4KClRoYW5rcwoKCj4K
Pj4KPj4+PiBAQCAtMCwwICsxLDIgQEAKPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAo+Pj4+ICtvYmotJChDT05GSUdfVkRQQSkgKz0gdmRwYS5vCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYS5jIGIvZHJpdmVycy92aXJ0aW8vdmRwYS92ZHBh
LmMKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMmIw
ZTRhOWYxMDVkCj4+Pj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmRwYS92ZHBhLmMKPj4+PiBAQCAt
MCwwICsxLDE0MSBAQAo+Pj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5Cj4+Pj4gKy8qCj4+Pj4gKyAqIHZEUEEgYnVzLgo+Pj4+ICsgKgo+Pj4+ICsgKiBDb3B5cmln
aHQgKGMpIDIwMTksIFJlZCBIYXQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+Pj4gKyAqICAgICBB
dXRob3I6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+PiAyMDIwIHRlc3RzIGRh
eXMKPj4KPj4gV2lsbCBmaXguCj4+Cj4+Cj4+Pj4gKyAqCj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiAr
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvaWRyLmg+Cj4+
Pj4gKyNpbmNsdWRlIDxsaW51eC92ZHBhLmg+Cj4+Pj4gKwo+Pj4+ICsjZGVmaW5lIE1PRF9WRVJT
SU9OICAiMC4xIgo+Pj4gSSB0aGluayBtb2R1bGUgdmVyc2lvbnMgYXJlIGRpc2NvdXJhZ2VkIHRo
ZXNlIGRheXMKPj4KPj4gV2lsbCByZW1vdmUuCj4+Cj4+Cj4+Pj4gKyNkZWZpbmUgTU9EX0RFU0Mg
ICAgICJ2RFBBIGJ1cyIKPj4+PiArI2RlZmluZSBNT0RfQVVUSE9SICAgIkphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+Igo+Pj4+ICsjZGVmaW5lIE1PRF9MSUNFTlNFICAiR1BMIHYyIgo+
Pj4+ICsKPj4+PiArc3RhdGljIERFRklORV9JREEodmRwYV9pbmRleF9pZGEpOwo+Pj4+ICsKPj4+
PiArc3RydWN0IGRldmljZSAqdmRwYV9nZXRfcGFyZW50KHN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YSkKPj4+PiArewo+Pj4+ICsJcmV0dXJuIHZkcGEtPmRldi5wYXJlbnQ7Cj4+Pj4gK30KPj4+PiAr
RVhQT1JUX1NZTUJPTCh2ZHBhX2dldF9wYXJlbnQpOwo+Pj4+ICsKPj4+PiArdm9pZCB2ZHBhX3Nl
dF9wYXJlbnQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQp
Cj4+Pj4gK3sKPj4+PiArCXZkcGEtPmRldi5wYXJlbnQgPSBwYXJlbnQ7Cj4+Pj4gK30KPj4+PiAr
RVhQT1JUX1NZTUJPTCh2ZHBhX3NldF9wYXJlbnQpOwo+Pj4+ICsKPj4+PiArc3RydWN0IHZkcGFf
ZGV2aWNlICpkZXZfdG9fdmRwYShzdHJ1Y3QgZGV2aWNlICpfZGV2KQo+Pj4+ICt7Cj4+Pj4gKwly
ZXR1cm4gY29udGFpbmVyX29mKF9kZXYsIHN0cnVjdCB2ZHBhX2RldmljZSwgZGV2KTsKPj4+PiAr
fQo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChkZXZfdG9fdmRwYSk7Cj4+Pj4gKwo+Pj4+ICtzdHJ1
Y3QgZGV2aWNlICp2ZHBhX3RvX2RldihzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4+Pj4gK3sK
Pj4+PiArCXJldHVybiAmdmRwYS0+ZGV2Owo+Pj4+ICt9Cj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BM
KHZkcGFfdG9fZGV2KTsKPj4+IFdoeSB0aGVzZSB0cml2aWFsIGFzc2Vzc29ycz8gU2VlbXMgdW5u
ZWNlc3NhcnksIG9yIHNob3VsZCBhdCBsZWFzdCBiZQo+Pj4gc3RhdGljIGlubGluZXMgaW4gYSBo
ZWFkZXIKPj4KPj4gV2lsbCBmaXguCj4+Cj4+Cj4+Pj4gK2ludCByZWdpc3Rlcl92ZHBhX2Rldmlj
ZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4+Pj4gK3sKPj4+IFVzdWFsbHkgd2Ugd2FudCB0
byBzZWUgc3ltYm9scyBjb25zaXN0ZW50bHkgcHJlZml4ZWQgd2l0aCB2ZHBhXyosIGlzCj4+PiB0
aGVyZSBhIHJlYXNvbiB3aHkgcmVnaXN0ZXIvdW5yZWdpc3RlciBhcmUgc3dhcHBlZD8KPj4KPj4g
SSBmb2xsb3cgdGhlIG5hbWUgZnJvbSB2aXJ0aW8uIEkgd2lsbCBzd2l0Y2ggdG8gdmRwYV8qLgo+
Pgo+Pgo+Pj4+ICsJaW50IGVycjsKPj4+PiArCj4+Pj4gKwlpZiAoIXZkcGFfZ2V0X3BhcmVudCh2
ZHBhKSkKPj4+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4gKwlpZiAoIXZkcGEtPmNv
bmZpZykKPj4+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4gKwllcnIgPSBpZGFfc2lt
cGxlX2dldCgmdmRwYV9pbmRleF9pZGEsIDAsIDAsIEdGUF9LRVJORUwpOwo+Pj4+ICsJaWYgKGVy
ciA8IDApCj4+Pj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4+Pj4gKwo+Pj4+ICsJdmRwYS0+ZGV2LmJ1
cyA9ICZ2ZHBhX2J1czsKPj4+PiArCWRldmljZV9pbml0aWFsaXplKCZ2ZHBhLT5kZXYpOwo+Pj4g
SU1ITyBkZXZpY2VfaW5pdGlhbGl6ZSBzaG91bGQgbm90IGJlIGNhbGxlZCBpbnNpZGUgc29tZXRo
aW5nIGNhbGxlZAo+Pj4gcmVnaXN0ZXIsIHRvb29mdGVuIHdlIGZpbmQgb3V0IHRoYXQgdGhlIGNh
bGxlciBkcml2ZXJzIG5lZWQgdGhlIGRldmljZQo+Pj4gdG8gYmUgaW5pdGlhbGl6ZWQgZWFybGll
ciwgaWUgdG8gdXNlIHRoZSBrcmVmLCBvciBzb21ldGhpbmcuCj4+Pgo+Pj4gSSBmaW5kIHRoZSBi
ZXN0IGZsb3cgaXMgdG8gaGF2ZSBzb21lIGluaXQgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQo+Pj4g
ZGV2aWNlX2luaXRpYWxpemUgYW5kIHNldHMgdGhlIGRldmljZV9uYW1lIHRoYXQgdGhlIGRyaXZl
ciBjYW4gY2FsbAo+Pj4gZWFybHkuCj4+Cj4+IE9rLCB3aWxsIGRvLgo+Pgo+Pgo+Pj4gU2hvdWxk
bid0IHRoZXJlIGJlIGEgZGV2aWNlL2RyaXZlciBtYXRjaGluZyBwcm9jZXNzIG9mIHNvbWUga2lu
ZD8KPj4KPj4gVGhlIHF1ZXN0aW9uIGlzIHdoYXQgZG8gd2Ugd2FudCBkbyBtYXRjaCBoZXJlLgo+
Pgo+PiAxKSAidmlydGlvIiB2cyAidmhvc3QiLCBJIGltcGxlbWVudGVkIG1hdGNoaW5nIG1ldGhv
ZCBmb3IgdGhpcyBpbiBtZGV2Cj4+IHNlcmllcywgYnV0IGl0IGxvb2tzIHVubmVjZXNzYXJ5IGZv
ciB2RFBBIGRldmljZSBkcml2ZXIgdG8ga25vdyBhYm91dAo+PiB0aGlzLiBBbnl3YXkgd2UgY2Fu
IHVzZSBzeXNmcyBkcml2ZXIgYmluZC91bmJpbmQgdG8gc3dpdGNoIGRyaXZlcnMKPj4gMikgdmly
dGlvIGRldmljZSBpZCBhbmQgdmVuZG9yIGlkLiBJJ20gbm90IHN1cmUgd2UgbmVlZCB0aGlzIGNv
bnNpZGVyCj4+IHRoZSB0d28gZHJpdmVycyBzbyBmYXIgKHZpcnRpby92aG9zdCkgYXJlIGFsbCBi
dXMgZHJpdmVycy4KPj4KPj4gVGhhbmtzCj4+Cj4+Cj4+PiBKYXNvbgo+Pj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
