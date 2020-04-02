Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8019C509
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:57:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E33B8879F5;
	Thu,  2 Apr 2020 14:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekTCKcGeqmZu; Thu,  2 Apr 2020 14:57:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 091D487985;
	Thu,  2 Apr 2020 14:57:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5E2BC07FF;
	Thu,  2 Apr 2020 14:57:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F206C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2D550203D8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQUe68WnHQBn
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:57:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id DEDBF203D5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585839432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cX0Ayw3Xz460+4fTWlRmLhPI5M2rPACv0FEFSZR57aI=;
 b=enmUMHiOL0eHNGvk4GxUEgRZIhlvqamZvDif2k0X9bGVjBvNOwXqkDPA2enbgezwHEe2LT
 f89LlT3/D5DZWO1USg4axbvSeC0gfwps/ar5uhASKo3uYSbndX47f2a1/KRgvJVujAvon3
 Q92fVIMVTNNvHR3igtG9WWZfbHTNdvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-R8hW2wg4N8W25ULrh6t8nQ-1; Thu, 02 Apr 2020 10:57:11 -0400
X-MC-Unique: R8hW2wg4N8W25ULrh6t8nQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D92C1084431;
 Thu,  2 Apr 2020 14:57:08 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 058341147CD;
 Thu,  2 Apr 2020 14:56:46 +0000 (UTC)
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
 <279ed96c-5331-9da6-f9c1-b49e87d49c31@redhat.com>
 <20200402103813-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a050b02a-cb4f-2821-393e-35e3f5920192@redhat.com>
Date: Thu, 2 Apr 2020 22:56:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402103813-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvNC8yIOS4i+WNiDEwOjM4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBBcHIgMDIsIDIwMjAgYXQgMTA6MjM6NTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzIg5LiL5Y2IMTA6MDMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFRodSwgQXByIDAyLCAyMDIwIGF0IDExOjIyOjU3QU0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAyMC80LzIg5LiK5Y2IMTI6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6Mjk6MzJQTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+ID5Gcm9tIDliM2E1ZDIzYjhiZjZiMGExMWU2NWU2ODgzMzVkNzgy
ZjhlNmFhNWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+Pj4+PiBGcm9tOiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+Pj4gRGF0ZTogV2VkLCAxIEFwciAyMDIwIDIyOjE3
OjI3ICswODAwCj4+Pj4+PiBTdWJqZWN0OiBbUEFUQ0hdIHZob3N0OiBsZXQgQ09ORklHX1ZIT1NU
IHRvIGJlIHNlbGVjdGVkIGJ5IGRyaXZlcnMKPj4+Pj4+Cj4+Pj4+PiBUaGUgZGVmY29uZmlnIG9u
IHNvbWUgYXJjaHMgZW5hYmxlIHZob3N0X25ldCBvciB2aG9zdF92c29jayBieQo+Pj4+Pj4gZGVm
YXVsdC4gU28gaW5zdGVhZCBvZiBhZGRpbmcgQ09ORklHX1ZIT1NUPW0gdG8gYWxsIG9mIHRob3Nl
IGZpbGVzLAo+Pj4+Pj4gc2ltcGx5IGxldHRpbmcgQ09ORklHX1ZIT1NUIHRvIGJlIHNlbGVjdGVk
IGJ5IGFsbCBvZiB0aGUgdmhvc3QKPj4+Pj4+IGRyaXZlcnMuIFRoaXMgZml4ZXMgdGhlIGJ1aWxk
IG9uIHRoZSBhcmNocyB3aXRoIENPTkZJR19WSE9TVF9ORVQ9bSBpbgo+Pj4+Pj4gdGhlaXIgZGVm
Y29uZmlnLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICAgICBkcml2ZXJzL3Zob3N0L0tjb25maWcg
fCAxNSArKysrKysrKysrKy0tLS0KPj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aG9zdC9LY29uZmlnIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4+Pj4+PiBpbmRleCAyNTIz
YTFkNDI5MGEuLjM2MmI4MzJmNTMzOCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvdmhvc3Qv
S2NvbmZpZwo+Pj4+Pj4gKysrIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4+Pj4+PiBAQCAtMTEs
MTkgKzExLDIzIEBAIGNvbmZpZyBWSE9TVF9SSU5HCj4+Pj4+PiAgICAgCSAgVGhpcyBvcHRpb24g
aXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVkcyB0byBhY2Nlc3MKPj4+Pj4+ICAg
ICAJICB0aGUgaG9zdCBzaWRlIG9mIGEgdmlydGlvIHJpbmcuCj4+Pj4+PiAtbWVudWNvbmZpZyBW
SE9TVAo+Pj4+Pj4gLQl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9yIHZpcnRp
byAoVkhPU1QpIgo+Pj4+Pj4gLQlkZXBlbmRzIG9uIEVWRU5URkQKPj4+Pj4+ICtjb25maWcgVkhP
U1QKPj4+Pj4+ICsJdHJpc3RhdGUKPj4+Pj4+ICAgICAJc2VsZWN0IFZIT1NUX0lPVExCCj4+Pj4+
PiAgICAgCWhlbHAKPj4+Pj4+ICAgICAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkg
ZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+Pj4+Pj4gICAgIAkgIHRoZSBjb3JlIG9mIHZo
b3N0Lgo+Pj4+Pj4gLWlmIFZIT1NUCj4+Pj4+PiArbWVudWNvbmZpZyBWSE9TVF9NRU5VCj4+Pj4+
PiArCWJvb2wgIlZIT1NUIGRyaXZlcnMiCj4+Pj4+PiArCWRlZmF1bHQgeQo+Pj4+Pj4gKwo+Pj4+
Pj4gK2lmIFZIT1NUX01FTlUKPj4+Pj4+ICAgICBjb25maWcgVkhPU1RfTkVUCj4+Pj4+PiAgICAg
CXRyaXN0YXRlICJIb3N0IGtlcm5lbCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIG5ldCIKPj4+Pj4+
ICAgICAJZGVwZW5kcyBvbiBORVQgJiYgRVZFTlRGRCAmJiAoVFVOIHx8ICFUVU4pICYmIChUQVAg
fHwgIVRBUCkKPj4+Pj4+ICsJc2VsZWN0IFZIT1NUCj4+Pj4+PiAgICAgCS0tLWhlbHAtLS0KPj4+
Pj4+ICAgICAJICBUaGlzIGtlcm5lbCBtb2R1bGUgY2FuIGJlIGxvYWRlZCBpbiBob3N0IGtlcm5l
bCB0byBhY2NlbGVyYXRlCj4+Pj4+PiAgICAgCSAgZ3Vlc3QgbmV0d29ya2luZyB3aXRoIHZpcnRp
b19uZXQuIE5vdCB0byBiZSBjb25mdXNlZCB3aXRoIHZpcnRpb19uZXQKPj4+Pj4+IEBAIC0zNSw2
ICszOSw3IEBAIGNvbmZpZyBWSE9TVF9ORVQKPj4+Pj4+ICAgICBjb25maWcgVkhPU1RfU0NTSQo+
Pj4+Pj4gICAgIAl0cmlzdGF0ZSAiVkhPU1RfU0NTSSBUQ00gZmFicmljIGRyaXZlciIKPj4+Pj4+
ICAgICAJZGVwZW5kcyBvbiBUQVJHRVRfQ09SRSAmJiBFVkVOVEZECj4+Pj4+PiArCXNlbGVjdCBW
SE9TVAo+Pj4+Pj4gICAgIAlkZWZhdWx0IG4KPj4+Pj4+ICAgICAJLS0taGVscC0tLQo+Pj4+Pj4g
ICAgIAlTYXkgTSBoZXJlIHRvIGVuYWJsZSB0aGUgdmhvc3Rfc2NzaSBUQ00gZmFicmljIG1vZHVs
ZQo+Pj4+Pj4gQEAgLTQzLDYgKzQ4LDcgQEAgY29uZmlnIFZIT1NUX1NDU0kKPj4+Pj4+ICAgICBj
b25maWcgVkhPU1RfVlNPQ0sKPj4+Pj4+ICAgICAJdHJpc3RhdGUgInZob3N0IHZpcnRpby12c29j
ayBkcml2ZXIiCj4+Pj4+PiAgICAgCWRlcGVuZHMgb24gVlNPQ0tFVFMgJiYgRVZFTlRGRAo+Pj4+
Pj4gKwlzZWxlY3QgVkhPU1QKPj4+Pj4+ICAgICAJc2VsZWN0IFZJUlRJT19WU09DS0VUU19DT01N
T04KPj4+Pj4+ICAgICAJZGVmYXVsdCBuCj4+Pj4+PiAgICAgCS0tLWhlbHAtLS0KPj4+Pj4+IEBA
IC01Niw2ICs2Miw3IEBAIGNvbmZpZyBWSE9TVF9WU09DSwo+Pj4+Pj4gICAgIGNvbmZpZyBWSE9T
VF9WRFBBCj4+Pj4+PiAgICAgCXRyaXN0YXRlICJWaG9zdCBkcml2ZXIgZm9yIHZEUEEtYmFzZWQg
YmFja2VuZCIKPj4+Pj4+ICAgICAJZGVwZW5kcyBvbiBFVkVOVEZECj4+Pj4+PiArCXNlbGVjdCBW
SE9TVAo+Pj4+IFRoaXMgcGFydCBpcyBub3Qgc3F1YXNoZWQuCj4+Pj4KPj4+Pgo+Pj4+Pj4gICAg
IAlzZWxlY3QgVkRQQQo+Pj4+Pj4gICAgIAloZWxwCj4+Pj4+PiAgICAgCSAgVGhpcyBrZXJuZWwg
bW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gaG9zdCBrZXJuZWwgdG8gYWNjZWxlcmF0ZQo+Pj4+PiBP
SyBzbyBJIHNxdWFzaGVkIHRoaXMgaW50byB0aGUgb3JpZ2luYWwgYnVnZ3kgcGF0Y2guCj4+Pj4+
IENvdWxkIHlvdSBwbGVhc2UgcGxheSB3aXRoIHZob3N0IGJyYW5jaCBvZiBteSB0cmVlIG9uIHZh
cmlvdXMKPj4+Pj4gYXJjaGVzPyBJZiBpdCBsb29rcyBvayB0byB5b3UgbGV0IG1lIGtub3cgSSds
bCBwdXNoCj4+Pj4+IHRoaXMgdG8gbmV4dC4KPj4+PiBXaXRoIHRoZSBhYm92ZSBwYXJ0IHNxdWFz
aGVkLiBJJ3ZlIHRlc3RlZCBhbGwgdGhlIGFyY2hzIHdob3NlIGRlZmNvbmZpZyBoYXZlCj4+Pj4g
VkhPU1RfTkVUIG9yIFZIT1NUX1ZTT0NLIGVuYWJsZWQuCj4+Pj4KPj4+PiBBbGwgbG9va3MgZmlu
ZS4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gSSdtIGEgYml0IGNvbmZ1c2VkLiBTbyBpcyB0aGUgbmV4
dCB0YWcgaW4gbXkgdHJlZSBvayBub3c/Cj4+Cj4+IFN0aWxsIG5lZWQgdG8gc2VsZWN0IENPTkZJ
R19WSE9TVCBmb3LCoCBDT05GSUdfVkhPU1RfVkRQQS4gT3RoZXJzIGFyZSBvay4KPj4KPj4gVGhh
bmtzCj4KPiBPaCBsaWtlIHRoaXMgdGhlbj8KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0
L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiBpbmRleCBiZGQyNzBmZWRlMjYuLmNi
NmIxNzMyM2ViMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiArKysgYi9k
cml2ZXJzL3Zob3N0L0tjb25maWcKPiBAQCAtNjEsNiArNjMsNyBAQCBjb25maWcgVkhPU1RfVlNP
Q0sKPiAgIGNvbmZpZyBWSE9TVF9WRFBBCj4gICAJdHJpc3RhdGUgIlZob3N0IGRyaXZlciBmb3Ig
dkRQQS1iYXNlZCBiYWNrZW5kIgo+ICAgCWRlcGVuZHMgb24gRVZFTlRGRAo+ICsJc2VsZWN0IFZI
T1NUCj4gICAJc2VsZWN0IFZEUEEKPiAgIAloZWxwCj4gICAJICBUaGlzIGtlcm5lbCBtb2R1bGUg
Y2FuIGJlIGxvYWRlZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVyYXRlCgoKWWVzLgoKVGhhbmtz
CgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
