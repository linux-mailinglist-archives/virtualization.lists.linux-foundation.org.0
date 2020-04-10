Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE01A437B
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 10:24:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B81908821F;
	Fri, 10 Apr 2020 08:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbBH8fhC98r0; Fri, 10 Apr 2020 08:24:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 374D98820F;
	Fri, 10 Apr 2020 08:24:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE43C0177;
	Fri, 10 Apr 2020 08:24:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E27F2C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DBFC684EE2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTHHXMW7ZGEf
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:24:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EAA8484C2C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586507048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhbDWM/COmRzn52zE0cD200v2Q1E5S+PCb8ygVpftN0=;
 b=ZkiY/9DgjaD0nKscVkIRHTtQCuX5upxBYXB4mF8P/5FEGlCWSwfhEJB6ICld0emaFbKPQ5
 6DYiwNwXGJuO1bn7MMR+eO7c+t6BK0NqIl5WZl22L8H/kP2efTnPY7GxpKKbHU9DON9+ZX
 BOmZFX2jJFt9WarCasf88i5lK6KZBCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-jQWAT0sWMkGl3PDpjBe6gA-1; Fri, 10 Apr 2020 04:24:05 -0400
X-MC-Unique: jQWAT0sWMkGl3PDpjBe6gA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4DD6DB60;
 Fri, 10 Apr 2020 08:24:02 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB11760BFB;
 Fri, 10 Apr 2020 08:23:40 +0000 (UTC)
Subject: Re: [PATCH V9 8/9] vdpasim: vDPA device simulator
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-9-jasowang@redhat.com>
 <CAMuHMdUis3O_mJKOb2s=_=Zs61iHus5Aq74N3-xs7kmjN+egoQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <108f65dd-f1b1-54ec-ae26-49842f3686b6@redhat.com>
Date: Fri, 10 Apr 2020 16:23:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUis3O_mJKOb2s=_=Zs61iHus5Aq74N3-xs7kmjN+egoQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: KVM list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Martin Habets <mhabets@solarflare.com>,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com,
 Christoph Hellwig <hch@infradead.org>, eperezma@redhat.com,
 Jason Gunthorpe <jgg@mellanox.com>, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, Jiri Pirko <jiri@mellanox.com>,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev <netdev@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8xMCDkuIvljYgzOjQ1LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkg
SmFzb24sCj4KPiBPbiBUaHUsIE1hciAyNiwgMjAyMCBhdCAzOjA3IFBNIEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+PiBUaGlzIHBhdGNoIGltcGxlbWVudHMgYSBzb2Z0
d2FyZSB2RFBBIG5ldHdvcmtpbmcgZGV2aWNlLiBUaGUgZGF0YXBhdGgKPj4gaXMgaW1wbGVtZW50
ZWQgdGhyb3VnaCB2cmluZ2ggYW5kIHdvcmtxdWV1ZS4gVGhlIGRldmljZSBoYXMgYW4gb24tY2hp
cAo+PiBJT01NVSB3aGljaCB0cmFuc2xhdGVzIElPVkEgdG8gUEEuIEZvciBrZXJuZWwgdmlydGlv
IGRyaXZlcnMsIHZEUEEKPj4gc2ltdWxhdG9yIGRyaXZlciBwcm92aWRlcyBkbWFfb3BzLiBGb3Ig
dmhvc3QgZHJpZXJzLCBzZXRfbWFwKCkgbWV0aG9kcwo+PiBvZiB2ZHBhX2NvbmZpZ19vcHMgaXMg
aW1wbGVtZW50ZWQgdG8gYWNjZXB0IG1hcHBpbmdzIGZyb20gdmhvc3QuCj4+Cj4+IEN1cnJlbnRs
eSwgdkRQQSBkZXZpY2Ugc2ltdWxhdG9yIHdpbGwgbG9vcGJhY2sgVFggdHJhZmZpYyB0byBSWC4g
U28KPj4gdGhlIG1haW4gdXNlIGNhc2UgZm9yIHRoZSBkZXZpY2UgaXMgdkRQQSBmZWF0dXJlIHRl
c3RpbmcsIHByb3RvdHlwaW5nCj4+IGFuZCBkZXZlbG9wbWVudC4KPj4KPj4gTm90ZSwgdGhlcmUn
cyBubyBtYW5hZ2VtZW50IEFQSSBpbXBsZW1lbnRlZCwgYSB2RFBBIGRldmljZSB3aWxsIGJlCj4+
IHJlZ2lzdGVyZWQgb25jZSB0aGUgbW9kdWxlIGlzIHByb2JlZC4gV2UgbmVlZCB0byBoYW5kbGUg
dGhpcyBpbiB0aGUKPj4gZnV0dXJlIGRldmVsb3BtZW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IFRoaXMgaXMgbm93IGNvbW1pdCAyYzUz
ZDBmNjRjMDZmNDU4ICgidmRwYXNpbTogdkRQQSBkZXZpY2Ugc2ltdWxhdG9yIikuCj4KPj4gLS0t
IGEvZHJpdmVycy92aXJ0aW8vdmRwYS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3Zk
cGEvS2NvbmZpZwo+PiBAQCAtNSwzICs1LDIyIEBAIGNvbmZpZyBWRFBBCj4+ICAgICAgICAgICAg
RW5hYmxlIHRoaXMgbW9kdWxlIHRvIHN1cHBvcnQgdkRQQSBkZXZpY2UgdGhhdCB1c2VzIGEKPj4g
ICAgICAgICAgICBkYXRhcGF0aCB3aGljaCBjb21wbGllcyB3aXRoIHZpcnRpbyBzcGVjaWZpY2F0
aW9ucyB3aXRoCj4+ICAgICAgICAgICAgdmVuZG9yIHNwZWNpZmljIGNvbnRyb2wgcGF0aC4KPj4g
Kwo+PiArbWVudWNvbmZpZyBWRFBBX01FTlUKPj4gKyAgICAgICBib29sICJWRFBBIGRyaXZlcnMi
Cj4+ICsgICAgICAgZGVmYXVsdCBuCj4gICAgICAqCj4gICAgICAqIFZEUEEgZHJpdmVycwo+ICAg
ICAgKgo+ICAgICAgVkRQQSBkcml2ZXJzIChWRFBBX01FTlUpIFtOL3kvP10gKE5FVykgPwo+Cj4g
ICAgICBUaGVyZSBpcyBubyBoZWxwIGF2YWlsYWJsZSBmb3IgdGhpcyBvcHRpb24uCj4gICAgICBT
eW1ib2w6IFZEUEFfTUVOVSBbPW5dCj4gICAgICBUeXBlICA6IGJvb2wKPiAgICAgIERlZmluZWQg
YXQgZHJpdmVycy92ZHBhL0tjb25maWc6OQo+ICAgICAgIFByb21wdDogVkRQQSBkcml2ZXJzCj4g
ICAgICAgTG9jYXRpb246Cj4gICAgICAgICAtPiBEZXZpY2UgRHJpdmVycwo+Cj4gSSB0aGluayB0
aGlzIGRlc2VydmVzIGEgaGVscCB0ZXh0LCBzbyB1c2VycyBrbm93IGlmIHRoZXkgd2FudCB0byBl
bmFibGUgdGhpcwo+IG9wdGlvbiBvciBub3QuCgoKV2lsbCBhZGQgYSBoZWxwIHRleHQgZm9yIHRo
aXMuCgoKPgo+IEkgaGFkIGEgcXVpY2sgbG9vaywgYnV0IGNvdWxkbid0IGZpbmQgdGhlIG1lYW5p
bmcgb2YgInZkcGEiIGluIHRoZSB3aG9sZSBrZXJuZWwKPiBzb3VyY2UgdHJlZS4KCgpUaGUgbWVh
bmluZyB3YXMgZXhwbGFpbmVkIGluIHRoZSBjb21taXQgbG9nIG9mIAo5NjFlOWM4NDA3N2Y2Yzg1
NzlkN2E2MjhjYmU5NGE2NzVjYjY3YWU0IGFuZCBoZWxwIHRleHQgZm9yIENPTkZJR19WRFBBLgoK
VGhhbmtzCgoKPgo+IFRoYW5rcyEKPgo+PiArCj4+ICtpZiBWRFBBX01FTlUKPj4gKwo+PiArY29u
ZmlnIFZEUEFfU0lNCj4+ICsgICAgICAgdHJpc3RhdGUgInZEUEEgZGV2aWNlIHNpbXVsYXRvciIK
Pj4gKyAgICAgICBkZXBlbmRzIG9uIFJVTlRJTUVfVEVTVElOR19NRU5VCj4+ICsgICAgICAgc2Vs
ZWN0IFZEUEEKPj4gKyAgICAgICBzZWxlY3QgVkhPU1RfUklORwo+PiArICAgICAgIGRlZmF1bHQg
bgo+PiArICAgICAgIGhlbHAKPj4gKyAgICAgICAgIHZEUEEgbmV0d29ya2luZyBkZXZpY2Ugc2lt
dWxhdG9yIHdoaWNoIGxvb3AgVFggdHJhZmZpYyBiYWNrCj4+ICsgICAgICAgICB0byBSWC4gVGhp
cyBkZXZpY2UgaXMgdXNlZCBmb3IgdGVzdGluZywgcHJvdG90eXBpbmcgYW5kCj4+ICsgICAgICAg
ICBkZXZlbG9wbWVudCBvZiB2RFBBLgo+PiArCj4+ICtlbmRpZiAjIFZEUEFfTUVOVQo+IEdye29l
dGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
