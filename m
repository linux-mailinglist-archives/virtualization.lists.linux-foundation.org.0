Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39319C3EE
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:24:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D2EBB20360;
	Thu,  2 Apr 2020 14:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OftWGFfu7nq; Thu,  2 Apr 2020 14:24:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABC5221507;
	Thu,  2 Apr 2020 14:24:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BDC1C07FF;
	Thu,  2 Apr 2020 14:24:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F213C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 85F8187F83
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tG+d6y5rvs8n
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:24:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D1D3B87F89
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585837466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mYSo22iWcFqA/r6k/de5Mv2kT9DwYwYj/Ezb0Wvqxk=;
 b=SfmTWKHXYQ36Cv0j77yfOmsRvEnpexLJ2vvPTMy+ZtWRDyXTO1OsztXXuWbQdCzV2u4T6K
 4nPpUrFIQNtK82WLhMVnR9OiXd12YCk9fRy/4EKuCVbGmrqXZT2BN62w9u3a4UsWfKKbh1
 +sCHT92vFgthp6yctWhH+wVn+ixUvhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-oMzpdL5KPNC8pTQTYyXmrw-1; Thu, 02 Apr 2020 10:24:24 -0400
X-MC-Unique: oMzpdL5KPNC8pTQTYyXmrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B17D5805733;
 Thu,  2 Apr 2020 14:24:21 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4675D9C9;
 Thu,  2 Apr 2020 14:24:00 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
 <20200401120643-mutt-send-email-mst@kernel.org>
 <c11c2195-88eb-2096-af47-40f2da5b389f@redhat.com>
 <20200402100257-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <279ed96c-5331-9da6-f9c1-b49e87d49c31@redhat.com>
Date: Thu, 2 Apr 2020 22:23:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402100257-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8yIOS4i+WNiDEwOjAzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBBcHIgMDIsIDIwMjAgYXQgMTE6MjI6NTdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzIg5LiK5Y2IMTI6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFdlZCwgQXByIDAxLCAyMDIwIGF0IDEwOjI5OjMyUE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gPkZyb20gOWIzYTVkMjNiOGJmNmIwYTExZTY1ZTY4ODMzNWQ3ODJmOGU2YWE1YyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4+PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPgo+Pj4+IERhdGU6IFdlZCwgMSBBcHIgMjAyMCAyMjoxNzoyNyArMDgwMAo+Pj4+
IFN1YmplY3Q6IFtQQVRDSF0gdmhvc3Q6IGxldCBDT05GSUdfVkhPU1QgdG8gYmUgc2VsZWN0ZWQg
YnkgZHJpdmVycwo+Pj4+Cj4+Pj4gVGhlIGRlZmNvbmZpZyBvbiBzb21lIGFyY2hzIGVuYWJsZSB2
aG9zdF9uZXQgb3Igdmhvc3RfdnNvY2sgYnkKPj4+PiBkZWZhdWx0LiBTbyBpbnN0ZWFkIG9mIGFk
ZGluZyBDT05GSUdfVkhPU1Q9bSB0byBhbGwgb2YgdGhvc2UgZmlsZXMsCj4+Pj4gc2ltcGx5IGxl
dHRpbmcgQ09ORklHX1ZIT1NUIHRvIGJlIHNlbGVjdGVkIGJ5IGFsbCBvZiB0aGUgdmhvc3QKPj4+
PiBkcml2ZXJzLiBUaGlzIGZpeGVzIHRoZSBidWlsZCBvbiB0aGUgYXJjaHMgd2l0aCBDT05GSUdf
VkhPU1RfTkVUPW0gaW4KPj4+PiB0aGVpciBkZWZjb25maWcuCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGRy
aXZlcnMvdmhvc3QvS2NvbmZpZyB8IDE1ICsrKysrKysrKysrLS0tLQo+Pj4+ICAgIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+Pj4+
IGluZGV4IDI1MjNhMWQ0MjkwYS4uMzYyYjgzMmY1MzM4IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZwo+Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+Pj4+IEBA
IC0xMSwxOSArMTEsMjMgQEAgY29uZmlnIFZIT1NUX1JJTkcKPj4+PiAgICAJICBUaGlzIG9wdGlv
biBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+Pj4+ICAg
IAkgIHRoZSBob3N0IHNpZGUgb2YgYSB2aXJ0aW8gcmluZy4KPj4+PiAtbWVudWNvbmZpZyBWSE9T
VAo+Pj4+IC0JdHJpc3RhdGUgIkhvc3Qga2VybmVsIGFjY2VsZXJhdG9yIGZvciB2aXJ0aW8gKFZI
T1NUKSIKPj4+PiAtCWRlcGVuZHMgb24gRVZFTlRGRAo+Pj4+ICtjb25maWcgVkhPU1QKPj4+PiAr
CXRyaXN0YXRlCj4+Pj4gICAgCXNlbGVjdCBWSE9TVF9JT1RMQgo+Pj4+ICAgIAloZWxwCj4+Pj4g
ICAgCSAgVGhpcyBvcHRpb24gaXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVkcyB0
byBhY2Nlc3MKPj4+PiAgICAJICB0aGUgY29yZSBvZiB2aG9zdC4KPj4+PiAtaWYgVkhPU1QKPj4+
PiArbWVudWNvbmZpZyBWSE9TVF9NRU5VCj4+Pj4gKwlib29sICJWSE9TVCBkcml2ZXJzIgo+Pj4+
ICsJZGVmYXVsdCB5Cj4+Pj4gKwo+Pj4+ICtpZiBWSE9TVF9NRU5VCj4+Pj4gICAgY29uZmlnIFZI
T1NUX05FVAo+Pj4+ICAgIAl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9yIHZp
cnRpbyBuZXQiCj4+Pj4gICAgCWRlcGVuZHMgb24gTkVUICYmIEVWRU5URkQgJiYgKFRVTiB8fCAh
VFVOKSAmJiAoVEFQIHx8ICFUQVApCj4+Pj4gKwlzZWxlY3QgVkhPU1QKPj4+PiAgICAJLS0taGVs
cC0tLQo+Pj4+ICAgIAkgIFRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qg
a2VybmVsIHRvIGFjY2VsZXJhdGUKPj4+PiAgICAJICBndWVzdCBuZXR3b3JraW5nIHdpdGggdmly
dGlvX25ldC4gTm90IHRvIGJlIGNvbmZ1c2VkIHdpdGggdmlydGlvX25ldAo+Pj4+IEBAIC0zNSw2
ICszOSw3IEBAIGNvbmZpZyBWSE9TVF9ORVQKPj4+PiAgICBjb25maWcgVkhPU1RfU0NTSQo+Pj4+
ICAgIAl0cmlzdGF0ZSAiVkhPU1RfU0NTSSBUQ00gZmFicmljIGRyaXZlciIKPj4+PiAgICAJZGVw
ZW5kcyBvbiBUQVJHRVRfQ09SRSAmJiBFVkVOVEZECj4+Pj4gKwlzZWxlY3QgVkhPU1QKPj4+PiAg
ICAJZGVmYXVsdCBuCj4+Pj4gICAgCS0tLWhlbHAtLS0KPj4+PiAgICAJU2F5IE0gaGVyZSB0byBl
bmFibGUgdGhlIHZob3N0X3Njc2kgVENNIGZhYnJpYyBtb2R1bGUKPj4+PiBAQCAtNDMsNiArNDgs
NyBAQCBjb25maWcgVkhPU1RfU0NTSQo+Pj4+ICAgIGNvbmZpZyBWSE9TVF9WU09DSwo+Pj4+ICAg
IAl0cmlzdGF0ZSAidmhvc3QgdmlydGlvLXZzb2NrIGRyaXZlciIKPj4+PiAgICAJZGVwZW5kcyBv
biBWU09DS0VUUyAmJiBFVkVOVEZECj4+Pj4gKwlzZWxlY3QgVkhPU1QKPj4+PiAgICAJc2VsZWN0
IFZJUlRJT19WU09DS0VUU19DT01NT04KPj4+PiAgICAJZGVmYXVsdCBuCj4+Pj4gICAgCS0tLWhl
bHAtLS0KPj4+PiBAQCAtNTYsNiArNjIsNyBAQCBjb25maWcgVkhPU1RfVlNPQ0sKPj4+PiAgICBj
b25maWcgVkhPU1RfVkRQQQo+Pj4+ICAgIAl0cmlzdGF0ZSAiVmhvc3QgZHJpdmVyIGZvciB2RFBB
LWJhc2VkIGJhY2tlbmQiCj4+Pj4gICAgCWRlcGVuZHMgb24gRVZFTlRGRAo+Pj4+ICsJc2VsZWN0
IFZIT1NUCj4+Cj4+IFRoaXMgcGFydCBpcyBub3Qgc3F1YXNoZWQuCj4+Cj4+Cj4+Pj4gICAgCXNl
bGVjdCBWRFBBCj4+Pj4gICAgCWhlbHAKPj4+PiAgICAJICBUaGlzIGtlcm5lbCBtb2R1bGUgY2Fu
IGJlIGxvYWRlZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVyYXRlCj4+PiBPSyBzbyBJIHNxdWFz
aGVkIHRoaXMgaW50byB0aGUgb3JpZ2luYWwgYnVnZ3kgcGF0Y2guCj4+PiBDb3VsZCB5b3UgcGxl
YXNlIHBsYXkgd2l0aCB2aG9zdCBicmFuY2ggb2YgbXkgdHJlZSBvbiB2YXJpb3VzCj4+PiBhcmNo
ZXM/IElmIGl0IGxvb2tzIG9rIHRvIHlvdSBsZXQgbWUga25vdyBJJ2xsIHB1c2gKPj4+IHRoaXMg
dG8gbmV4dC4KPj4KPj4gV2l0aCB0aGUgYWJvdmUgcGFydCBzcXVhc2hlZC4gSSd2ZSB0ZXN0ZWQg
YWxsIHRoZSBhcmNocyB3aG9zZSBkZWZjb25maWcgaGF2ZQo+PiBWSE9TVF9ORVQgb3IgVkhPU1Rf
VlNPQ0sgZW5hYmxlZC4KPj4KPj4gQWxsIGxvb2tzIGZpbmUuCj4+Cj4+IFRoYW5rcwo+Cj4gSSdt
IGEgYml0IGNvbmZ1c2VkLiBTbyBpcyB0aGUgbmV4dCB0YWcgaW4gbXkgdHJlZSBvayBub3c/CgoK
U3RpbGwgbmVlZCB0byBzZWxlY3QgQ09ORklHX1ZIT1NUIGZvcsKgIENPTkZJR19WSE9TVF9WRFBB
LiBPdGhlcnMgYXJlIG9rLgoKVGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
