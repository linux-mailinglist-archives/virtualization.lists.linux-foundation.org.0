Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D1301D96
	for <lists.virtualization@lfdr.de>; Sun, 24 Jan 2021 17:50:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82A6F8691B;
	Sun, 24 Jan 2021 16:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1cjgGV9IZupL; Sun, 24 Jan 2021 16:50:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1649B86885;
	Sun, 24 Jan 2021 16:50:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9299C013A;
	Sun, 24 Jan 2021 16:50:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6184AC013A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5D49C85E24
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDR1TwNvOxQi
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:49:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 80A148550D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:49:57 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id AC8C8A1469;
 Sun, 24 Jan 2021 17:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=26S5GrdORKcV
 CmT1ovKDPCHNpi4LYfhtYFW1MoqnkKk=; b=bVaJkV5D6ATWQVauBJWBQDxumtxP
 pv2aUeBo9AVvogHPGtHAV+WAGr2xwZoLnBv/gyGjeJJM6f6bBD1qv02zBc9FtaSi
 XIu3CV4UKcRThhMYBX+81yBDz+sXVGhC1xjhBVFz3B+LoD83/AE4f4yH50hz5fuU
 Wwt0khc42m0Ig+MwNy2dSxFrYCazNv2CnoLkIFN+90vdgr9aJLEtJPBXbYt5DQGf
 Q2YecGRo7I7atoxFKBpKIQeaObLuT5GDJUulR3e4YsEbYyp8yCA6o2YwfRKM+msE
 pZjjtzK+Baqr/eitUck1thQH67nlK7IXdXKpAPdp1cglPfHDZ1NUuWruZQ==
Subject: Re: [PATCH 4/7] ALSA: virtio: handling control and I/O messages for
 the PCM device
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
 <20210120003638.3339987-5-anton.yakovlev@opensynergy.com>
 <20210120032711-mutt-send-email-mst@kernel.org>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <59121ced-c306-ee7b-b98d-8fa2674326ad@opensynergy.com>
Date: Sun, 24 Jan 2021 17:49:52 +0100
MIME-Version: 1.0
In-Reply-To: <20210120032711-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
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

CgpPbiAyMC4wMS4yMDIxIDA5OjI5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gQ0FVVElP
TjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9u
Lgo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4KPiAKPiAKPiBP
biBXZWQsIEphbiAyMCwgMjAyMSBhdCAwMTozNjozMkFNICswMTAwLCBBbnRvbiBZYWtvdmxldiB3
cm90ZToKPj4gVGhlIGRyaXZlciBpbXBsZW1lbnRzIGEgbWVzc2FnZS1iYXNlZCB0cmFuc3BvcnQg
Zm9yIEkvTyBzdWJzdHJlYW0KPj4gb3BlcmF0aW9ucy4gQmVmb3JlIHRoZSBzdGFydCBvZiB0aGUg
c3Vic3RyZWFtLCB0aGUgaGFyZHdhcmUgYnVmZmVyIGlzCj4+IHNsaWNlZCBpbnRvIEkvTyBtZXNz
YWdlcywgdGhlIG51bWJlciBvZiB3aGljaCBpcyBlcXVhbCB0byB0aGUgY3VycmVudAo+PiBudW1i
ZXIgb2YgcGVyaW9kcy4gVGhlIHNpemUgb2YgZWFjaCBtZXNzYWdlIGlzIGVxdWFsIHRvIHRoZSBj
dXJyZW50Cj4+IHNpemUgb2Ygb25lIHBlcmlvZC4KPj4KPj4gSS9PIG1lc3NhZ2VzIGFyZSBvcmdh
bml6ZWQgaW4gYW4gb3JkZXJlZCBxdWV1ZS4gVGhlIGNvbXBsZXRpb24gb2YgdGhlCj4+IEkvTyBt
ZXNzYWdlIGluZGljYXRlcyBhbiBleHBpcmVkIHBlcmlvZCAodGhlIG9ubHkgZXhjZXB0aW9uIGlz
IHRoZSBlbmQKPj4gb2YgdGhlIHN0cmVhbSBmb3IgdGhlIGNhcHR1cmUgc3Vic3RyZWFtKS4gVXBv
biBjb21wbGV0aW9uLCB0aGUgbWVzc2FnZQo+PiBpcyBhdXRvbWF0aWNhbGx5IHJlLWFkZGVkIHRv
IHRoZSBlbmQgb2YgdGhlIHF1ZXVlLgo+Pgo+PiBXaGVuIGFuIEkvTyBtZXNzYWdlIGlzIGNvbXBs
ZXRlZCwgdGhlIGh3X3B0ciB2YWx1ZSBpcyBpbmNyZW1lbnRlZAo+PiB1bmNvbmRpdGlvbmFsbHkg
KHRvIGVuc3VyZSB0aGF0IHRoZSBod19wdHIgYWx3YXlzIGNvcnJlY3RseSByZWZsZWN0cwo+PiB0
aGUgc3RhdGUgb2YgdGhlIG1lc3NhZ2VzIGluIHRoZSB2aXJ0cXVldWUpLiBEdWUgdG8gaXRzIGFz
eW5jaHJvbm91cwo+PiBuYXR1cmUsIGEgbWVzc2FnZSBjYW4gYmUgY29tcGxldGVkIHdoZW4gdGhl
IHJ1bnRpbWUgc3RydWN0dXJlIG5vIGxvbmdlcgo+PiBleGlzdHMuIEZvciB0aGlzIHJlYXNvbiwg
dGhlIHZhbHVlcyBmcm9tIHRoaXMgc3RydWN0dXJlIGFyZSBjYWNoZWQgaW4KPj4gdGhlIHZpcnRp
byBzdWJzdHJlYW0sIHdoaWNoIGFyZSByZXF1aXJlZCB0byBjYWxjdWxhdGUgdGhlIG5ldyB2YWx1
ZSBvZgo+PiB0aGUgaHdfcHRyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBZYWtvdmxldiA8
YW50b24ueWFrb3ZsZXZAb3BlbnN5bmVyZ3kuY29tPgo+PiAtLS0KPj4gICBzb3VuZC92aXJ0aW8v
TWFrZWZpbGUgICAgICAgICB8ICAgMyArLQo+PiAgIHNvdW5kL3ZpcnRpby92aXJ0aW9fY2FyZC5j
ICAgIHwgIDMzICsrKysKPj4gICBzb3VuZC92aXJ0aW8vdmlydGlvX2NhcmQuaCAgICB8ICAgOSAr
Cj4+ICAgc291bmQvdmlydGlvL3ZpcnRpb19wY20uYyAgICAgfCAgIDMgKwo+PiAgIHNvdW5kL3Zp
cnRpby92aXJ0aW9fcGNtLmggICAgIHwgIDMxICsrKysKPj4gICBzb3VuZC92aXJ0aW8vdmlydGlv
X3BjbV9tc2cuYyB8IDMxNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAg
NiBmaWxlcyBjaGFuZ2VkLCAzOTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC92aXJ0aW8vdmlydGlvX3BjbV9tc2cuYwo+Pgo+PiBkaWZm
IC0tZ2l0IGEvc291bmQvdmlydGlvL01ha2VmaWxlIGIvc291bmQvdmlydGlvL01ha2VmaWxlCj4+
IGluZGV4IDY5MTYyYTU0NWE0MS4uNjI2YWYzY2MzZWQ3IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC92
aXJ0aW8vTWFrZWZpbGUKPj4gKysrIGIvc291bmQvdmlydGlvL01ha2VmaWxlCj4+IEBAIC01LDUg
KzUsNiBAQCBvYmotJChDT05GSUdfU05EX1ZJUlRJTykgKz0gdmlydGlvX3NuZC5vCj4+ICAgdmly
dGlvX3NuZC1vYmpzIDo9IFwKPj4gICAgICAgIHZpcnRpb19jYXJkLm8gXAo+PiAgICAgICAgdmly
dGlvX2N0bF9tc2cubyBcCj4+IC0gICAgIHZpcnRpb19wY20ubwo+PiArICAgICB2aXJ0aW9fcGNt
Lm8gXAo+PiArICAgICB2aXJ0aW9fcGNtX21zZy5vCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC92
aXJ0aW8vdmlydGlvX2NhcmQuYyBiL3NvdW5kL3ZpcnRpby92aXJ0aW9fY2FyZC5jCj4+IGluZGV4
IDI5M2Q0OTdmMjRlNy4uZGM3MDNmYzY2MmY1IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC92aXJ0aW8v
dmlydGlvX2NhcmQuYwo+PiArKysgYi9zb3VuZC92aXJ0aW8vdmlydGlvX2NhcmQuYwo+PiBAQCAt
MTQ1LDYgKzE0NSwxMiBAQCBzdGF0aWMgaW50IHZpcnRzbmRfZmluZF92cXMoc3RydWN0IHZpcnRp
b19zbmQgKnNuZCkKPj4gICAgICAgIGNhbGxiYWNrc1tWSVJUSU9fU05EX1ZRX0NPTlRST0xdID0g
dmlydHNuZF9jdGxfbm90aWZ5X2NiOwo+PiAgICAgICAgY2FsbGJhY2tzW1ZJUlRJT19TTkRfVlFf
RVZFTlRdID0gdmlydHNuZF9ldmVudF9ub3RpZnlfY2I7Cj4+Cj4+ICsgICAgIHZpcnRpb19jcmVh
ZCh2ZGV2LCBzdHJ1Y3QgdmlydGlvX3NuZF9jb25maWcsIHN0cmVhbXMsICZuKTsKPj4gKyAgICAg
aWYgKG4pIHsKPj4gKyAgICAgICAgICAgICBjYWxsYmFja3NbVklSVElPX1NORF9WUV9UWF0gPSB2
aXJ0c25kX3BjbV90eF9ub3RpZnlfY2I7Cj4+ICsgICAgICAgICAgICAgY2FsbGJhY2tzW1ZJUlRJ
T19TTkRfVlFfUlhdID0gdmlydHNuZF9wY21fcnhfbm90aWZ5X2NiOwo+PiArICAgICB9Cj4+ICsK
Pj4gICAgICAgIHJjID0gdmlydGlvX2ZpbmRfdnFzKHZkZXYsIFZJUlRJT19TTkRfVlFfTUFYLCB2
cXMsIGNhbGxiYWNrcywgbmFtZXMsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxM
KTsKPj4gICAgICAgIGlmIChyYykgewo+PiBAQCAtMTg2LDE1ICsxOTIsNDIgQEAgc3RhdGljIGlu
dCB2aXJ0c25kX2ZpbmRfdnFzKHN0cnVjdCB2aXJ0aW9fc25kICpzbmQpCj4+ICAgICogdmlydHNu
ZF9lbmFibGVfdnFzKCkgLSBFbmFibGUgdGhlIGV2ZW50LCB0eCBhbmQgcnggdmlydHF1ZXVlcy4K
Pj4gICAgKiBAc25kOiBWaXJ0SU8gc291bmQgZGV2aWNlLgo+PiAgICAqCj4+ICsgKiBUaGUgdHgg
cXVldWUgaXMgZW5hYmxlZCBvbmx5IGlmIHRoZSBkZXZpY2Ugc3VwcG9ydHMgcGxheWJhY2sgc3Ry
ZWFtKHMpLgo+PiArICoKPj4gKyAqIFRoZSByeCBxdWV1ZSBpcyBlbmFibGVkIG9ubHkgaWYgdGhl
IGRldmljZSBzdXBwb3J0cyBjYXB0dXJlIHN0cmVhbShzKS4KPj4gKyAqCj4+ICAgICogQ29udGV4
dDogQW55IGNvbnRleHQuCj4+ICAgICovCj4+ICAgc3RhdGljIHZvaWQgdmlydHNuZF9lbmFibGVf
dnFzKHN0cnVjdCB2aXJ0aW9fc25kICpzbmQpCj4+ICAgewo+PiArICAgICBzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldiA9IHNuZC0+dmRldjsKPj4gICAgICAgIHN0cnVjdCB2aXJ0cXVldWUgKnZx
dWV1ZTsKPj4gKyAgICAgc3RydWN0IHZpcnRpb19wY20gKnBjbTsKPj4gKyAgICAgdW5zaWduZWQg
aW50IG5wYnMgPSAwOwo+PiArICAgICB1bnNpZ25lZCBpbnQgbmNwcyA9IDA7Cj4+Cj4+ICAgICAg
ICB2cXVldWUgPSBzbmQtPnF1ZXVlc1tWSVJUSU9fU05EX1ZRX0VWRU5UXS52cXVldWU7Cj4+ICAg
ICAgICBpZiAoIXZpcnRxdWV1ZV9lbmFibGVfY2IodnF1ZXVlKSkKPj4gICAgICAgICAgICAgICAg
dmlydHNuZF9ldmVudF9ub3RpZnlfY2IodnF1ZXVlKTsKPj4gKwo+PiArICAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KHBjbSwgJnNuZC0+cGNtX2xpc3QsIGxpc3QpIHsKPj4gKyAgICAgICAgICAgICBu
cGJzICs9IHBjbS0+c3RyZWFtc1tTTkRSVl9QQ01fU1RSRUFNX1BMQVlCQUNLXS5uc3Vic3RyZWFt
czsKPj4gKyAgICAgICAgICAgICBuY3BzICs9IHBjbS0+c3RyZWFtc1tTTkRSVl9QQ01fU1RSRUFN
X0NBUFRVUkVdLm5zdWJzdHJlYW1zOwo+PiArICAgICB9Cj4+ICsKPj4gKyAgICAgaWYgKG5wYnMp
IHsKPj4gKyAgICAgICAgICAgICB2cXVldWUgPSBzbmQtPnF1ZXVlc1tWSVJUSU9fU05EX1ZRX1RY
XS52cXVldWU7Cj4+ICsgICAgICAgICAgICAgaWYgKCF2aXJ0cXVldWVfZW5hYmxlX2NiKHZxdWV1
ZSkpCj4+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybigmdmRldi0+ZGV2LAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInN1c3BpY2lvdXMgbm90aWZpY2F0aW9uIGluIHRo
ZSBUWCBxdWV1ZVxuIik7Cj4+ICsgICAgIH0KPj4gKwo+PiArICAgICBpZiAobmNwcykgewo+PiAr
ICAgICAgICAgICAgIHZxdWV1ZSA9IHNuZC0+cXVldWVzW1ZJUlRJT19TTkRfVlFfUlhdLnZxdWV1
ZTsKPj4gKyAgICAgICAgICAgICBpZiAoIXZpcnRxdWV1ZV9lbmFibGVfY2IodnF1ZXVlKSkKPj4g
KyAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKCZ2ZGV2LT5kZXYsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAic3VzcGljaW91cyBub3RpZmljYXRpb24gaW4gdGhlIFJYIHF1
ZXVlXG4iKTsKPj4gKyAgICAgfQo+IAo+IE5vdCBzdXJlIGhvdyBhbGwgdGhpcyBwcmV2ZW50cyB1
c2Ugb2Ygc2FtZSB2cSBmcm9tIG11bHRpcGxlIHRocmVhZHMgLi4uCj4gQW5kIHdoeSBhcmUgd2Ug
c3VyZSB0aGVyZSBhcmUgbm8gYnVmZmVycyB5ZXQ/ICBJZiB0aGF0IGlzIGJlY2F1c2UKPiBub3Ro
aW5nIHlldCBoYXBwZW5lZCwgdGhlbiBJJ2QgYWxzbyBsaWtlIHRvIHBvaW50IG91dCB0aGF0IGEg
dnEgc3RhcnRzCj4gb3V0IHdpdGggY2FsbGJhY2tzIGVuYWJsZWQsIHNvIHlvdSBkb24ndCBuZWVk
IHRvIGRvIHRoYXQgZmlyc3QgdGhpbmcgLi4uCgpZZXMsIEkgcmVkb25lIHRoYXQgbG9naWMgaW4g
djIuCgoKPj4gICB9Cj4+Cj4+ICAgLyoqCj4+IGRpZmYgLS1naXQgYS9zb3VuZC92aXJ0aW8vdmly
dGlvX2NhcmQuaCBiL3NvdW5kL3ZpcnRpby92aXJ0aW9fY2FyZC5oCj4+IGluZGV4IGJlNjY1MWE2
YWFmOC4uYjExYzA5OTg0ODgyIDEwMDY0NAo+PiAtLS0gYS9zb3VuZC92aXJ0aW8vdmlydGlvX2Nh
cmQuaAo+PiArKysgYi9zb3VuZC92aXJ0aW8vdmlydGlvX2NhcmQuaAo+PiBAQCAtODksNCArODks
MTMgQEAgdmlydHNuZF9yeF9xdWV1ZShzdHJ1Y3QgdmlydGlvX3NuZCAqc25kKQo+PiAgICAgICAg
cmV0dXJuICZzbmQtPnF1ZXVlc1tWSVJUSU9fU05EX1ZRX1JYXTsKPj4gICB9Cj4+Cj4+ICtzdGF0
aWMgaW5saW5lIHN0cnVjdCB2aXJ0aW9fc25kX3F1ZXVlICoKPj4gK3ZpcnRzbmRfcGNtX3F1ZXVl
KHN0cnVjdCB2aXJ0aW9fcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtKQo+PiArewo+PiArICAgICBp
ZiAoc3Vic3RyZWFtLT5kaXJlY3Rpb24gPT0gU05EUlZfUENNX1NUUkVBTV9QTEFZQkFDSykKPj4g
KyAgICAgICAgICAgICByZXR1cm4gdmlydHNuZF90eF9xdWV1ZShzdWJzdHJlYW0tPnNuZCk7Cj4+
ICsgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICByZXR1cm4gdmlydHNuZF9yeF9xdWV1ZShzdWJz
dHJlYW0tPnNuZCk7Cj4+ICt9Cj4+ICsKPj4gICAjZW5kaWYgLyogVklSVElPX1NORF9DQVJEX0gg
Ki8KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3ZpcnRpby92aXJ0aW9fcGNtLmMgYi9zb3VuZC92aXJ0
aW8vdmlydGlvX3BjbS5jCj4+IGluZGV4IDAzNjk5MGI3Yjc4YS4uMWFiNTBkY2M4OGM4IDEwMDY0
NAo+PiAtLS0gYS9zb3VuZC92aXJ0aW8vdmlydGlvX3BjbS5jCj4+ICsrKyBiL3NvdW5kL3ZpcnRp
by92aXJ0aW9fcGNtLmMKPj4gQEAgLTM3Niw2ICszNzYsNyBAQCBpbnQgdmlydHNuZF9wY21fcGFy
c2VfY2ZnKHN0cnVjdCB2aXJ0aW9fc25kICpzbmQpCj4+Cj4+ICAgICAgICAgICAgICAgIHN1YnN0
cmVhbS0+c25kID0gc25kOwo+PiAgICAgICAgICAgICAgICBzdWJzdHJlYW0tPnNpZCA9IGk7Cj4+
ICsgICAgICAgICAgICAgaW5pdF93YWl0cXVldWVfaGVhZCgmc3Vic3RyZWFtLT5tc2dfZW1wdHkp
Owo+Pgo+PiAgICAgICAgICAgICAgICByYyA9IHZpcnRzbmRfcGNtX2J1aWxkX2h3KHN1YnN0cmVh
bSwgJmluZm9baV0pOwo+PiAgICAgICAgICAgICAgICBpZiAocmMpCj4+IEBAIC01MzAsNiArNTMx
LDggQEAgdm9pZCB2aXJ0c25kX3BjbV9ldmVudChzdHJ1Y3QgdmlydGlvX3NuZCAqc25kLCBzdHJ1
Y3QgdmlydGlvX3NuZF9ldmVudCAqZXZlbnQpCj4+ICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAg
ICAgICAgfQo+PiAgICAgICAgY2FzZSBWSVJUSU9fU05EX0VWVF9QQ01fWFJVTjogewo+PiArICAg
ICAgICAgICAgIGlmIChhdG9taWNfcmVhZCgmc3Vic3RyZWFtLT54ZmVyX2VuYWJsZWQpKQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgYXRvbWljX3NldCgmc3Vic3RyZWFtLT54ZmVyX3hydW4sIDEp
Owo+PiAgICAgICAgICAgICAgICBicmVhazsKPj4gICAgICAgIH0KPj4gICAgICAgIH0KPj4gZGlm
ZiAtLWdpdCBhL3NvdW5kL3ZpcnRpby92aXJ0aW9fcGNtLmggYi9zb3VuZC92aXJ0aW8vdmlydGlv
X3BjbS5oCj4+IGluZGV4IDczZmI0ZDlkYzUyNC4uZDAxMWI3ZTFkMThkIDEwMDY0NAo+PiAtLS0g
YS9zb3VuZC92aXJ0aW8vdmlydGlvX3BjbS5oCj4+ICsrKyBiL3NvdW5kL3ZpcnRpby92aXJ0aW9f
cGNtLmgKPj4gQEAgLTI0LDYgKzI0LDcgQEAKPj4gICAjaW5jbHVkZSA8c291bmQvcGNtLmg+Cj4+
Cj4+ICAgc3RydWN0IHZpcnRpb19wY207Cj4+ICtzdHJ1Y3QgdmlydGlvX3BjbV9tc2c7Cj4+Cj4+
ICAgLyoqCj4+ICAgICogc3RydWN0IHZpcnRpb19wY21fc3Vic3RyZWFtIC0gVmlydElPIFBDTSBz
dWJzdHJlYW0uCj4+IEBAIC0zNCw2ICszNSwxNiBAQCBzdHJ1Y3QgdmlydGlvX3BjbTsKPj4gICAg
KiBAZmVhdHVyZXM6IFN0cmVhbSBWaXJ0SU8gZmVhdHVyZSBiaXQgbWFwICgxIDw8IFZJUlRJT19T
TkRfUENNX0ZfWFhYKS4KPj4gICAgKiBAc3Vic3RyZWFtOiBLZXJuZWwgQUxTQSBzdWJzdHJlYW0u
Cj4+ICAgICogQGh3OiBLZXJuZWwgQUxTQSBzdWJzdHJlYW0gaGFyZHdhcmUgZGVzY3JpcHRvci4K
Pj4gKyAqIEBmcmFtZV9ieXRlczogQ3VycmVudCBmcmFtZSBzaXplIGluIGJ5dGVzLgo+PiArICog
QHBlcmlvZF9zaXplOiBDdXJyZW50IHBlcmlvZCBzaXplIGluIGZyYW1lcy4KPj4gKyAqIEBidWZm
ZXJfc2l6ZTogQ3VycmVudCBidWZmZXIgc2l6ZSBpbiBmcmFtZXMuCj4+ICsgKiBAaHdfcHRyOiBT
dWJzdHJlYW0gaGFyZHdhcmUgcG9pbnRlciB2YWx1ZSBpbiBmcmFtZXMgWzAgLi4uIGJ1ZmZlcl9z
aXplKS4KPj4gKyAqIEB4ZmVyX2VuYWJsZWQ6IERhdGEgdHJhbnNmZXIgc3RhdGUgKDAgLSBvZmYs
IDEgLSBvbikuCj4+ICsgKiBAeGZlcl94cnVuOiBEYXRhIHVuZGVyZmxvdy9vdmVyZmxvdyBzdGF0
ZSAoMCAtIG5vIHhydW4sIDEgLSB4cnVuKS4KPj4gKyAqIEBtc2dzOiBJL08gbWVzc2FnZXMuCj4+
ICsgKiBAbXNnX2xhc3RfZW5xdWV1ZWQ6IEluZGV4IG9mIHRoZSBsYXN0IEkvTyBtZXNzYWdlIGFk
ZGVkIHRvIHRoZSB2aXJ0cXVldWUuCj4+ICsgKiBAbXNnX2NvdW50OiBOdW1iZXIgb2YgcGVuZGlu
ZyBJL08gbWVzc2FnZXMgaW4gdGhlIHZpcnRxdWV1ZS4KPj4gKyAqIEBtc2dfZW1wdHk6IE5vdGlm
eSB3aGVuIG1zZ19jb3VudCBpcyB6ZXJvLgo+PiAgICAqLwo+PiAgIHN0cnVjdCB2aXJ0aW9fcGNt
X3N1YnN0cmVhbSB7Cj4+ICAgICAgICBzdHJ1Y3QgdmlydGlvX3NuZCAqc25kOwo+PiBAQCAtNDMs
NiArNTQsMTYgQEAgc3RydWN0IHZpcnRpb19wY21fc3Vic3RyZWFtIHsKPj4gICAgICAgIHUzMiBm
ZWF0dXJlczsKPj4gICAgICAgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtOwo+
PiAgICAgICAgc3RydWN0IHNuZF9wY21faGFyZHdhcmUgaHc7Cj4+ICsgICAgIHVuc2lnbmVkIGlu
dCBmcmFtZV9ieXRlczsKPj4gKyAgICAgc25kX3BjbV91ZnJhbWVzX3QgcGVyaW9kX3NpemU7Cj4+
ICsgICAgIHNuZF9wY21fdWZyYW1lc190IGJ1ZmZlcl9zaXplOwo+PiArICAgICBhdG9taWNfdCBo
d19wdHI7Cj4+ICsgICAgIGF0b21pY190IHhmZXJfZW5hYmxlZDsKPj4gKyAgICAgYXRvbWljX3Qg
eGZlcl94cnVuOwo+PiArICAgICBzdHJ1Y3QgdmlydGlvX3BjbV9tc2cgKm1zZ3M7Cj4+ICsgICAg
IGludCBtc2dfbGFzdF9lbnF1ZXVlZDsKPj4gKyAgICAgYXRvbWljX3QgbXNnX2NvdW50Owo+PiAr
ICAgICB3YWl0X3F1ZXVlX2hlYWRfdCBtc2dfZW1wdHk7Cj4+ICAgfTsKPj4KPj4gICAvKioKPj4g
QEAgLTg2LDQgKzEwNywxNCBAQCBzdHJ1Y3QgdmlydGlvX3BjbSAqdmlydHNuZF9wY21fZmluZChz
dHJ1Y3QgdmlydGlvX3NuZCAqc25kLCB1bnNpZ25lZCBpbnQgbmlkKTsKPj4gICBzdHJ1Y3Qgdmly
dGlvX3BjbSAqdmlydHNuZF9wY21fZmluZF9vcl9jcmVhdGUoc3RydWN0IHZpcnRpb19zbmQgKnNu
ZCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IG5pZCk7Cj4+Cj4+ICtzdHJ1Y3QgdmlydGlvX3NuZF9tc2cgKgo+PiArdmlydHNuZF9w
Y21fY3RsX21zZ19hbGxvYyhzdHJ1Y3QgdmlydGlvX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNvbW1hbmQsIGdmcF90IGdm
cCk7Cj4+ICsKPj4gK2ludCB2aXJ0c25kX3BjbV9tc2dfYWxsb2Moc3RydWN0IHZpcnRpb19wY21f
c3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBubXNnLCB1OCAqZG1hX2FyZWEsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBwZXJpb2RfYnl0ZXMpOwo+PiArCj4+ICtpbnQgdmlydHNuZF9wY21fbXNnX3NlbmQo
c3RydWN0IHZpcnRpb19wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0pOwo+PiArCj4+ICAgI2VuZGlm
IC8qIFZJUlRJT19TTkRfUENNX0ggKi8KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3ZpcnRpby92aXJ0
aW9fcGNtX21zZy5jIGIvc291bmQvdmlydGlvL3ZpcnRpb19wY21fbXNnLmMKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jZmJlNTkzNTUyN2EKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9zb3VuZC92aXJ0aW8vdmlydGlvX3BjbV9tc2cuYwo+PiBAQCAtMCww
ICsxLDMxNyBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCj4+ICsv
Kgo+PiArICogU291bmQgY2FyZCBkcml2ZXIgZm9yIHZpcnRpbwo+PiArICogQ29weXJpZ2h0IChD
KSAyMDIwICBPcGVuU3luZXJneSBHbWJICj4+ICsgKgo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPj4gKyAq
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMg
cHVibGlzaGVkIGJ5Cj4+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkg
bGF0ZXIgdmVyc2lvbi4KPj4gKyAqCj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQg
aW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPj4gKyAqIGJ1dCBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4+ICsgKiBN
RVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUg
dGhlCj4+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+
PiArICoKPj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4+ICsgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYg
bm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lgo+PiArICovCj4+ICsjaW5j
bHVkZSA8c291bmQvcGNtX3BhcmFtcy5oPgo+PiArCj4+ICsjaW5jbHVkZSAidmlydGlvX2NhcmQu
aCIKPj4gKwo+PiArLyoqCj4+ICsgKiBlbnVtIHBjbV9tc2dfc2dfaW5kZXggLSBTY2F0dGVyLWdh
dGhlciBlbGVtZW50IGluZGV4ZXMgZm9yIGFuIEkvTyBtZXNzYWdlLgo+PiArICogQFBDTV9NU0df
U0dfWEZFUjogRWxlbWVudCBjb250YWluaW5nIGEgdmlydGlvX3NuZF9wY21feGZlciBzdHJ1Y3R1
cmUuCj4+ICsgKiBAUENNX01TR19TR19EQVRBOiBFbGVtZW50IGNvbnRhaW5pbmcgYSBkYXRhIGJ1
ZmZlci4KPj4gKyAqIEBQQ01fTVNHX1NHX1NUQVRVUzogRWxlbWVudCBjb250YWluaW5nIGEgdmly
dGlvX3NuZF9wY21fc3RhdHVzIHN0cnVjdHVyZS4KPj4gKyAqIEBQQ01fTVNHX1NHX01BWDogVGhl
IG1heGltdW0gbnVtYmVyIG9mIGVsZW1lbnRzIGluIHRoZSBzY2F0dGVyLWdhdGhlciB0YWJsZS4K
Pj4gKyAqCj4+ICsgKiBUaGVzZSB2YWx1ZXMgYXJlIHVzZWQgYXMgdGhlIGluZGV4IG9mIHRoZSBw
YXlsb2FkIHNjYXR0ZXItZ2F0aGVyIHRhYmxlLgo+PiArICovCj4+ICtlbnVtIHBjbV9tc2dfc2df
aW5kZXggewo+PiArICAgICBQQ01fTVNHX1NHX1hGRVIgPSAwLAo+PiArICAgICBQQ01fTVNHX1NH
X0RBVEEsCj4+ICsgICAgIFBDTV9NU0dfU0dfU1RBVFVTLAo+PiArICAgICBQQ01fTVNHX1NHX01B
WAo+PiArfTsKPj4gKwo+PiArLyoqCj4+ICsgKiBzdHJ1Y3QgdmlydGlvX3BjbV9tc2cgLSBWaXJ0
SU8gSS9PIG1lc3NhZ2UuCj4+ICsgKiBAc3Vic3RyZWFtOiBWaXJ0SU8gUENNIHN1YnN0cmVhbS4K
Pj4gKyAqIEB4ZmVyOiBSZXF1ZXN0IGhlYWRlciBwYXlsb2FkLgo+PiArICogQHN0YXR1czogUmVz
cG9uc2UgaGVhZGVyIHBheWxvYWQuCj4+ICsgKiBAc2dzOiBQYXlsb2FkIHNjYXR0ZXItZ2F0aGVy
IHRhYmxlLgo+PiArICovCj4+ICtzdHJ1Y3QgdmlydGlvX3BjbV9tc2cgewo+PiArICAgICBzdHJ1
Y3QgdmlydGlvX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbTsKPj4gKyAgICAgc3RydWN0IHZpcnRp
b19zbmRfcGNtX3hmZXIgeGZlcjsKPj4gKyAgICAgc3RydWN0IHZpcnRpb19zbmRfcGNtX3N0YXR1
cyBzdGF0dXM7Cj4+ICsgICAgIHN0cnVjdCBzY2F0dGVybGlzdCBzZ3NbUENNX01TR19TR19NQVhd
Owo+PiArfTsKPj4gKwo+PiArLyoqCj4+ICsgKiB2aXJ0c25kX3BjbV9tc2dfYWxsb2MoKSAtIEFs
bG9jYXRlIEkvTyBtZXNzYWdlcy4KPj4gKyAqIEBzdWJzdHJlYW06IFZpcnRJTyBQQ00gc3Vic3Ry
ZWFtLgo+PiArICogQG5tc2c6IE51bWJlciBvZiBtZXNzYWdlcyAoZXF1YWwgdG8gdGhlIG51bWJl
ciBvZiBwZXJpb2RzKS4KPj4gKyAqIEBkbWFfYXJlYTogUG9pbnRlciB0byB1c2VkIGF1ZGlvIGJ1
ZmZlci4KPj4gKyAqIEBwZXJpb2RfYnl0ZXM6IFBlcmlvZCAobWVzc2FnZSBwYXlsb2FkKSBzaXpl
Lgo+PiArICoKPj4gKyAqIFRoZSBmdW5jdGlvbiBzbGljZXMgdGhlIGJ1ZmZlciBpbnRvIG5tc2cg
cGFydHMgKGVhY2ggd2l0aCB0aGUgc2l6ZSBvZgo+PiArICogcGVyaW9kX2J5dGVzKSwgYW5kIGNy
ZWF0ZXMgbm1zZyBjb3JyZXNwb25kaW5nIEkvTyBtZXNzYWdlcy4KPj4gKyAqCj4+ICsgKiBDb250
ZXh0OiBBbnkgY29udGV4dCB0aGF0IHBlcm1pdHMgdG8gc2xlZXAuCj4+ICsgKiBSZXR1cm46IDAg
b24gc3VjY2VzcywgLUVOT01FTSBvbiBmYWlsdXJlLgo+PiArICovCj4+ICtpbnQgdmlydHNuZF9w
Y21fbXNnX2FsbG9jKHN0cnVjdCB2aXJ0aW9fcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbm1zZywgdTggKmRtYV9hcmVhLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGVyaW9kX2J5dGVzKQo+PiAr
ewo+PiArICAgICBzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiA9IHN1YnN0cmVhbS0+c25kLT52
ZGV2Owo+PiArICAgICB1bnNpZ25lZCBpbnQgaTsKPj4gKwo+PiArICAgICBpZiAoc3Vic3RyZWFt
LT5tc2dzKQo+PiArICAgICAgICAgICAgIGRldm1fa2ZyZWUoJnZkZXYtPmRldiwgc3Vic3RyZWFt
LT5tc2dzKTsKPj4gKwo+PiArICAgICBzdWJzdHJlYW0tPm1zZ3MgPSBkZXZtX2tjYWxsb2MoJnZk
ZXYtPmRldiwgbm1zZywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZigqc3Vic3RyZWFtLT5tc2dzKSwgR0ZQX0tFUk5FTCk7Cj4+ICsgICAgIGlmICghc3Vic3Ry
ZWFtLT5tc2dzKQo+PiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsgICAg
IGZvciAoaSA9IDA7IGkgPCBubXNnOyArK2kpIHsKPj4gKyAgICAgICAgICAgICBzdHJ1Y3Qgdmly
dGlvX3BjbV9tc2cgKm1zZyA9ICZzdWJzdHJlYW0tPm1zZ3NbaV07Cj4+ICsKPj4gKyAgICAgICAg
ICAgICBtc2ctPnN1YnN0cmVhbSA9IHN1YnN0cmVhbTsKPj4gKwo+PiArICAgICAgICAgICAgIHNn
X2luaXRfdGFibGUobXNnLT5zZ3MsIFBDTV9NU0dfU0dfTUFYKTsKPj4gKyAgICAgICAgICAgICBz
Z19pbml0X29uZSgmbXNnLT5zZ3NbUENNX01TR19TR19YRkVSXSwgJm1zZy0+eGZlciwKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YobXNnLT54ZmVyKSk7Cj4+ICsgICAgICAgICAg
ICAgc2dfaW5pdF9vbmUoJm1zZy0+c2dzW1BDTV9NU0dfU0dfREFUQV0sCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgZG1hX2FyZWEgKyBwZXJpb2RfYnl0ZXMgKiBpLCBwZXJpb2RfYnl0ZXMp
Owo+PiArICAgICAgICAgICAgIHNnX2luaXRfb25lKCZtc2ctPnNnc1tQQ01fTVNHX1NHX1NUQVRV
U10sICZtc2ctPnN0YXR1cywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YobXNn
LT5zdGF0dXMpKTsKPj4gKyAgICAgfQo+PiArCj4+ICsgICAgIHJldHVybiAwOwo+PiArfQo+PiAr
Cj4+ICsvKioKPj4gKyAqIHZpcnRzbmRfcGNtX21zZ19zZW5kKCkgLSBTZW5kIGFzeW5jaHJvbm91
cyBJL08gbWVzc2FnZXMuCj4+ICsgKiBAc3Vic3RyZWFtOiBWaXJ0SU8gUENNIHN1YnN0cmVhbS4K
Pj4gKyAqCj4+ICsgKiBBbGwgbWVzc2FnZXMgYXJlIG9yZ2FuaXplZCBpbiBhbiBvcmRlcmVkIGNp
cmN1bGFyIGxpc3QuIEVhY2ggdGltZSB0aGUKPj4gKyAqIGZ1bmN0aW9uIGlzIGNhbGxlZCwgYWxs
IGN1cnJlbnRseSBub24tZW5xdWV1ZWQgbWVzc2FnZXMgYXJlIGFkZGVkIHRvIHRoZQo+PiArICog
dmlydHF1ZXVlLiBGb3IgdGhpcywgdGhlIGZ1bmN0aW9uIGtlZXBzIHRyYWNrIG9mIHR3byB2YWx1
ZXM6Cj4+ICsgKgo+PiArICogICBtc2dfbGFzdF9lbnF1ZXVlZCA9IGluZGV4IG9mIHRoZSBsYXN0
IGVucXVldWVkIG1lc3NhZ2UsCj4+ICsgKiAgIG1zZ19jb3VudCA9ICMgb2YgcGVuZGluZyBtZXNz
YWdlcyBpbiB0aGUgdmlydHF1ZXVlLgo+PiArICoKPj4gKyAqIENvbnRleHQ6IEFueSBjb250ZXh0
Lgo+PiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIC1FSU8gb24gZmFpbHVyZS4KPj4gKyAqLwo+
PiAraW50IHZpcnRzbmRfcGNtX21zZ19zZW5kKHN0cnVjdCB2aXJ0aW9fcGNtX3N1YnN0cmVhbSAq
c3Vic3RyZWFtKQo+PiArewo+PiArICAgICBzdHJ1Y3Qgc25kX3BjbV9ydW50aW1lICpydW50aW1l
ID0gc3Vic3RyZWFtLT5zdWJzdHJlYW0tPnJ1bnRpbWU7Cj4+ICsgICAgIHN0cnVjdCB2aXJ0aW9f
c25kICpzbmQgPSBzdWJzdHJlYW0tPnNuZDsKPj4gKyAgICAgc3RydWN0IHZpcnRpb19kZXZpY2Ug
KnZkZXYgPSBzbmQtPnZkZXY7Cj4+ICsgICAgIHN0cnVjdCB2aXJ0cXVldWUgKnZxdWV1ZSA9IHZp
cnRzbmRfcGNtX3F1ZXVlKHN1YnN0cmVhbSktPnZxdWV1ZTsKPj4gKyAgICAgaW50IGk7Cj4+ICsg
ICAgIGludCBuOwo+PiArICAgICBib29sIG5vdGlmeSA9IGZhbHNlOwo+PiArCj4+ICsgICAgIGlm
ICghdnF1ZXVlKQo+PiArICAgICAgICAgICAgIHJldHVybiAtRUlPOwo+PiArCj4+ICsgICAgIGkg
PSAoc3Vic3RyZWFtLT5tc2dfbGFzdF9lbnF1ZXVlZCArIDEpICUgcnVudGltZS0+cGVyaW9kczsK
Pj4gKyAgICAgbiA9IHJ1bnRpbWUtPnBlcmlvZHMgLSBhdG9taWNfcmVhZCgmc3Vic3RyZWFtLT5t
c2dfY291bnQpOwo+PiArCj4+ICsgICAgIGZvciAoOyBuOyAtLW4sIGkgPSAoaSArIDEpICUgcnVu
dGltZS0+cGVyaW9kcykgewo+PiArICAgICAgICAgICAgIHN0cnVjdCB2aXJ0aW9fcGNtX21zZyAq
bXNnID0gJnN1YnN0cmVhbS0+bXNnc1tpXTsKPj4gKyAgICAgICAgICAgICBzdHJ1Y3Qgc2NhdHRl
cmxpc3QgKnBzZ3NbUENNX01TR19TR19NQVhdID0gewo+PiArICAgICAgICAgICAgICAgICAgICAg
W1BDTV9NU0dfU0dfWEZFUl0gPSAmbXNnLT5zZ3NbUENNX01TR19TR19YRkVSXSwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgIFtQQ01fTVNHX1NHX0RBVEFdID0gJm1zZy0+c2dzW1BDTV9NU0dfU0df
REFUQV0sCj4+ICsgICAgICAgICAgICAgICAgICAgICBbUENNX01TR19TR19TVEFUVVNdID0gJm1z
Zy0+c2dzW1BDTV9NU0dfU0dfU1RBVFVTXQo+PiArICAgICAgICAgICAgIH07Cj4+ICsgICAgICAg
ICAgICAgaW50IHJjOwo+PiArCj4+ICsgICAgICAgICAgICAgbXNnLT54ZmVyLnN0cmVhbV9pZCA9
IGNwdV90b192aXJ0aW8zMih2ZGV2LCBzdWJzdHJlYW0tPnNpZCk7Cj4+ICsgICAgICAgICAgICAg
bWVtc2V0KCZtc2ctPnN0YXR1cywgMCwgc2l6ZW9mKG1zZy0+c3RhdHVzKSk7Cj4+ICsKPj4gKyAg
ICAgICAgICAgICBhdG9taWNfaW5jKCZzdWJzdHJlYW0tPm1zZ19jb3VudCk7Cj4+ICsKPj4gKyAg
ICAgICAgICAgICBpZiAoc3Vic3RyZWFtLT5kaXJlY3Rpb24gPT0gU05EUlZfUENNX1NUUkVBTV9Q
TEFZQkFDSykKPj4gKyAgICAgICAgICAgICAgICAgICAgIHJjID0gdmlydHF1ZXVlX2FkZF9zZ3Mo
dnF1ZXVlLCBwc2dzLCAyLCAxLCBtc2csCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEdGUF9BVE9NSUMpOwo+PiArICAgICAgICAgICAgIGVsc2UKPj4gKyAg
ICAgICAgICAgICAgICAgICAgIHJjID0gdmlydHF1ZXVlX2FkZF9zZ3ModnF1ZXVlLCBwc2dzLCAx
LCAyLCBtc2csCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEdGUF9BVE9NSUMpOwo+PiArCj4+ICsgICAgICAgICAgICAgaWYgKHJjKSB7Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICBhdG9taWNfZGVjKCZzdWJzdHJlYW0tPm1zZ19jb3VudCk7Cj4+ICsgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPj4gKyAgICAgICAgICAgICB9Cj4+ICsKPj4g
KyAgICAgICAgICAgICBzdWJzdHJlYW0tPm1zZ19sYXN0X2VucXVldWVkID0gaTsKPj4gKyAgICAg
fQo+PiArCj4+ICsgICAgIGlmICghKHN1YnN0cmVhbS0+ZmVhdHVyZXMgJiAoMVUgPDwgVklSVElP
X1NORF9QQ01fRl9NU0dfUE9MTElORykpKQo+PiArICAgICAgICAgICAgIG5vdGlmeSA9IHZpcnRx
dWV1ZV9raWNrX3ByZXBhcmUodnF1ZXVlKTsKPj4gKwo+PiArICAgICBpZiAobm90aWZ5KQo+PiAr
ICAgICAgICAgICAgIGlmICghdmlydHF1ZXVlX25vdGlmeSh2cXVldWUpKQo+PiArICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU87Cj4+ICsKPj4gKyAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+
ICsKPj4gKy8qKgo+PiArICogdmlydHNuZF9wY21fbXNnX2NvbXBsZXRlKCkgLSBDb21wbGV0ZSBh
biBJL08gbWVzc2FnZS4KPj4gKyAqIEBtc2c6IEkvTyBtZXNzYWdlLgo+PiArICogQHNpemU6IE51
bWJlciBvZiBieXRlcyB3cml0dGVuLgo+PiArICoKPj4gKyAqIENvbXBsZXRpb24gb2YgdGhlIG1l
c3NhZ2UgbWVhbnMgdGhlIGVsYXBzZWQgcGVyaW9kOgo+PiArICogICAtIHVwZGF0ZSBoYXJkd2Fy
ZSBwb2ludGVyLAo+PiArICogICAtIHVwZGF0ZSBsYXRlbmN5IHZhbHVlLAo+PiArICogICAtIGtp
Y2sgdGhlIHVwcGVyIGxheWVyLgo+PiArICoKPj4gKyAqIENvbnRleHQ6IEludGVycnVwdCBjb250
ZXh0Lgo+PiArICovCj4+ICtzdGF0aWMgdm9pZCB2aXJ0c25kX3BjbV9tc2dfY29tcGxldGUoc3Ry
dWN0IHZpcnRpb19wY21fbXNnICptc2csIHNpemVfdCBzaXplKQo+PiArewo+PiArICAgICBzdHJ1
Y3QgdmlydGlvX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSA9IG1zZy0+c3Vic3RyZWFtOwo+PiAr
ICAgICBzbmRfcGNtX3VmcmFtZXNfdCBod19wdHI7Cj4+ICsgICAgIHVuc2lnbmVkIGludCBtc2df
Y291bnQ7Cj4+ICsKPj4gKyAgICAgaHdfcHRyID0gKHNuZF9wY21fdWZyYW1lc190KWF0b21pY19y
ZWFkKCZzdWJzdHJlYW0tPmh3X3B0cik7Cj4+ICsKPj4gKyAgICAgLyoKPj4gKyAgICAgICogSWYg
dGhlIGNhcHR1cmUgc3Vic3RyZWFtIHJldHVybmVkIGFuIGluY29ycmVjdCBzdGF0dXMsIHRoZW4g
anVzdAo+PiArICAgICAgKiBpbmNyZWFzZSB0aGUgaHdfcHRyIGJ5IHRoZSBwZXJpb2Qgc2l6ZS4K
Pj4gKyAgICAgICovCj4+ICsgICAgIGlmIChzdWJzdHJlYW0tPmRpcmVjdGlvbiA9PSBTTkRSVl9Q
Q01fU1RSRUFNX1BMQVlCQUNLIHx8Cj4+ICsgICAgICAgICBzaXplIDw9IHNpemVvZihtc2ctPnN0
YXR1cykpIHsKPj4gKyAgICAgICAgICAgICBod19wdHIgKz0gc3Vic3RyZWFtLT5wZXJpb2Rfc2l6
ZTsKPj4gKyAgICAgfSBlbHNlIHsKPj4gKyAgICAgICAgICAgICBzaXplIC09IHNpemVvZihtc2ct
PnN0YXR1cyk7Cj4+ICsgICAgICAgICAgICAgaHdfcHRyICs9IHNpemUgLyBzdWJzdHJlYW0tPmZy
YW1lX2J5dGVzOwo+PiArICAgICB9Cj4+ICsKPj4gKyAgICAgYXRvbWljX3NldCgmc3Vic3RyZWFt
LT5od19wdHIsICh1MzIpKGh3X3B0ciAlIHN1YnN0cmVhbS0+YnVmZmVyX3NpemUpKTsKPj4gKyAg
ICAgYXRvbWljX3NldCgmc3Vic3RyZWFtLT54ZmVyX3hydW4sIDApOwo+PiArCj4+ICsgICAgIG1z
Z19jb3VudCA9IGF0b21pY19kZWNfcmV0dXJuKCZzdWJzdHJlYW0tPm1zZ19jb3VudCk7Cj4+ICsK
Pj4gKyAgICAgaWYgKGF0b21pY19yZWFkKCZzdWJzdHJlYW0tPnhmZXJfZW5hYmxlZCkpIHsKPj4g
KyAgICAgICAgICAgICBzdHJ1Y3Qgc25kX3BjbV9ydW50aW1lICpydW50aW1lID0gc3Vic3RyZWFt
LT5zdWJzdHJlYW0tPnJ1bnRpbWU7Cj4+ICsKPj4gKyAgICAgICAgICAgICBydW50aW1lLT5kZWxh
eSA9Cj4+ICsgICAgICAgICAgICAgICAgICAgICBieXRlc190b19mcmFtZXMocnVudGltZSwKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShtc2ctPnN0
YXR1cy5sYXRlbmN5X2J5dGVzKSk7Cj4+ICsKPj4gKyAgICAgICAgICAgICBzbmRfcGNtX3Blcmlv
ZF9lbGFwc2VkKHN1YnN0cmVhbS0+c3Vic3RyZWFtKTsKPj4gKwo+PiArICAgICAgICAgICAgIHZp
cnRzbmRfcGNtX21zZ19zZW5kKHN1YnN0cmVhbSk7Cj4+ICsgICAgIH0gZWxzZSBpZiAoIW1zZ19j
b3VudCkgewo+PiArICAgICAgICAgICAgIHdha2VfdXBfYWxsKCZzdWJzdHJlYW0tPm1zZ19lbXB0
eSk7Cj4+ICsgICAgIH0KPj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiB2aXJ0c25kX3BjbV9ub3Rp
ZnlfY2IoKSAtIFByb2Nlc3MgYWxsIGNvbXBsZXRlZCBJL08gbWVzc2FnZXMuCj4+ICsgKiBAdnF1
ZXVlOiBVbmRlcmx5aW5nIHR4L3J4IHZpcnRxdWV1ZS4KPj4gKyAqCj4+ICsgKiBJZiB0cmFuc21p
c3Npb24gaXMgYWxsb3dlZCwgdGhlbiBlYWNoIGNvbXBsZXRlZCBtZXNzYWdlIGlzIGltbWVkaWF0
ZWx5IHBsYWNlZAo+PiArICogYmFjayBhdCB0aGUgZW5kIG9mIHRoZSBxdWV1ZS4KPj4gKyAqCj4+
ICsgKiBDb250ZXh0OiBJbnRlcnJ1cHQgY29udGV4dC4gVGFrZXMgYW5kIHJlbGVhc2VzIHRoZSB0
eC9yeCBxdWV1ZSBzcGlubG9jay4KPj4gKyAqLwo+PiArc3RhdGljIGlubGluZSB2b2lkIHZpcnRz
bmRfcGNtX25vdGlmeV9jYihzdHJ1Y3QgdmlydGlvX3NuZF9xdWV1ZSAqcXVldWUpCj4+ICt7Cj4+
ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+ICsKPj4gKyAgICAgc3Bpbl9sb2NrX2lycXNh
dmUoJnF1ZXVlLT5sb2NrLCBmbGFncyk7Cj4+ICsgICAgIHdoaWxlIChxdWV1ZS0+dnF1ZXVlKSB7
Cj4+ICsgICAgICAgICAgICAgdmlydHF1ZXVlX2Rpc2FibGVfY2IocXVldWUtPnZxdWV1ZSk7Cj4+
ICsKPj4gKyAgICAgICAgICAgICBmb3IgKDs7KSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgdmlydGlvX3BjbV9tc2cgKm1zZzsKPj4gKyAgICAgICAgICAgICAgICAgICAgIHUzMiBs
ZW5ndGg7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgICAgICAgIG1zZyA9IHZpcnRxdWV1ZV9nZXRf
YnVmKHF1ZXVlLT52cXVldWUsICZsZW5ndGgpOwo+PiArICAgICAgICAgICAgICAgICAgICAgaWYg
KCFtc2cpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArCj4+ICsg
ICAgICAgICAgICAgICAgICAgICB2aXJ0c25kX3BjbV9tc2dfY29tcGxldGUobXNnLCBsZW5ndGgp
Owo+PiArICAgICAgICAgICAgIH0KPj4gKwo+PiArICAgICAgICAgICAgIGlmICh1bmxpa2VseSh2
aXJ0cXVldWVfaXNfYnJva2VuKHF1ZXVlLT52cXVldWUpKSkKPj4gKyAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+PiArCj4+ICsgICAgICAgICAgICAgaWYgKHZpcnRxdWV1ZV9lbmFibGVfY2Io
cXVldWUtPnZxdWV1ZSkpCj4+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4gKyAgICAg
fQo+PiArICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZxdWV1ZS0+bG9jaywgZmxhZ3MpOwo+
PiArfQo+PiArCj4+ICsvKioKPj4gKyAqIHZpcnRzbmRfcGNtX3R4X25vdGlmeV9jYigpIC0gUHJv
Y2VzcyBhbGwgY29tcGxldGVkIFRYIG1lc3NhZ2VzLgo+PiArICogQHZxdWV1ZTogVW5kZXJseWlu
ZyB0eCB2aXJ0cXVldWUuCj4+ICsgKgo+PiArICogQ29udGV4dDogSW50ZXJydXB0IGNvbnRleHQu
Cj4+ICsgKi8KPj4gK3ZvaWQgdmlydHNuZF9wY21fdHhfbm90aWZ5X2NiKHN0cnVjdCB2aXJ0cXVl
dWUgKnZxdWV1ZSkKPj4gK3sKPj4gKyAgICAgc3RydWN0IHZpcnRpb19zbmQgKnNuZCA9IHZxdWV1
ZS0+dmRldi0+cHJpdjsKPj4gKwo+PiArICAgICB2aXJ0c25kX3BjbV9ub3RpZnlfY2IodmlydHNu
ZF90eF9xdWV1ZShzbmQpKTsKPj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiB2aXJ0c25kX3BjbV9y
eF9ub3RpZnlfY2IoKSAtIFByb2Nlc3MgYWxsIGNvbXBsZXRlZCBSWCBtZXNzYWdlcy4KPj4gKyAq
IEB2cXVldWU6IFVuZGVybHlpbmcgcnggdmlydHF1ZXVlLgo+PiArICoKPj4gKyAqIENvbnRleHQ6
IEludGVycnVwdCBjb250ZXh0Lgo+PiArICovCj4+ICt2b2lkIHZpcnRzbmRfcGNtX3J4X25vdGlm
eV9jYihzdHJ1Y3QgdmlydHF1ZXVlICp2cXVldWUpCj4+ICt7Cj4+ICsgICAgIHN0cnVjdCB2aXJ0
aW9fc25kICpzbmQgPSB2cXVldWUtPnZkZXYtPnByaXY7Cj4+ICsKPj4gKyAgICAgdmlydHNuZF9w
Y21fbm90aWZ5X2NiKHZpcnRzbmRfcnhfcXVldWUoc25kKSk7Cj4+ICt9Cj4+ICsKPj4gKy8qKgo+
PiArICogdmlydHNuZF9wY21fY3RsX21zZ19hbGxvYygpIC0gQWxsb2NhdGUgYW5kIGluaXRpYWxp
emUgdGhlIFBDTSBkZXZpY2UgY29udHJvbAo+PiArICogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWVzc2FnZSBmb3IgdGhlIHNwZWNpZmllZCBzdWJzdHJlYW0uCj4+ICsgKiBAc3Vic3Ry
ZWFtOiBWaXJ0SU8gUENNIHN1YnN0cmVhbS4KPj4gKyAqIEBjb21tYW5kOiBDb250cm9sIHJlcXVl
c3QgY29kZSAoVklSVElPX1NORF9SX1BDTV9YWFgpLgo+PiArICogQGdmcDogS2VybmVsIGZsYWdz
IGZvciBtZW1vcnkgYWxsb2NhdGlvbi4KPj4gKyAqCj4+ICsgKiBDb250ZXh0OiBBbnkgY29udGV4
dC4gTWF5IHNsZWVwIGlmIEBnZnAgZmxhZ3MgcGVybWl0Lgo+PiArICogUmV0dXJuOiBBbGxvY2F0
ZWQgbWVzc2FnZSBvbiBzdWNjZXNzLCBFUlJfUFRSKC1lcnJubykgb24gZmFpbHVyZS4KPj4gKyAq
Lwo+PiArc3RydWN0IHZpcnRpb19zbmRfbXNnICoKPj4gK3ZpcnRzbmRfcGNtX2N0bF9tc2dfYWxs
b2Moc3RydWN0IHZpcnRpb19wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjb21tYW5kLCBnZnBfdCBnZnApCj4+ICt7Cj4+ICsg
ICAgIHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2ID0gc3Vic3RyZWFtLT5zbmQtPnZkZXY7Cj4+
ICsgICAgIHNpemVfdCByZXF1ZXN0X3NpemUgPSBzaXplb2Yoc3RydWN0IHZpcnRpb19zbmRfcGNt
X2hkcik7Cj4+ICsgICAgIHNpemVfdCByZXNwb25zZV9zaXplID0gc2l6ZW9mKHN0cnVjdCB2aXJ0
aW9fc25kX2hkcik7Cj4+ICsgICAgIHN0cnVjdCB2aXJ0aW9fc25kX21zZyAqbXNnOwo+PiArCj4+
ICsgICAgIHN3aXRjaCAoY29tbWFuZCkgewo+PiArICAgICBjYXNlIFZJUlRJT19TTkRfUl9QQ01f
U0VUX1BBUkFNUzogewo+PiArICAgICAgICAgICAgIHJlcXVlc3Rfc2l6ZSA9IHNpemVvZihzdHJ1
Y3QgdmlydGlvX3NuZF9wY21fc2V0X3BhcmFtcyk7Cj4+ICsgICAgICAgICAgICAgYnJlYWs7Cj4+
ICsgICAgIH0KPj4gKyAgICAgfQo+PiArCj4+ICsgICAgIG1zZyA9IHZpcnRzbmRfY3RsX21zZ19h
bGxvYyh2ZGV2LCByZXF1ZXN0X3NpemUsIHJlc3BvbnNlX3NpemUsIGdmcCk7Cj4+ICsgICAgIGlm
ICghSVNfRVJSKG1zZykpIHsKPj4gKyAgICAgICAgICAgICBzdHJ1Y3QgdmlydGlvX3NuZF9wY21f
aGRyICpoZHIgPSBzZ192aXJ0KCZtc2ctPnNnX3JlcXVlc3QpOwo+PiArCj4+ICsgICAgICAgICAg
ICAgaGRyLT5oZHIuY29kZSA9IGNwdV90b192aXJ0aW8zMih2ZGV2LCBjb21tYW5kKTsKPj4gKyAg
ICAgICAgICAgICBoZHItPnN0cmVhbV9pZCA9IGNwdV90b192aXJ0aW8zMih2ZGV2LCBzdWJzdHJl
YW0tPnNpZCk7Cj4+ICsgICAgIH0KPj4gKwo+PiArICAgICByZXR1cm4gbXNnOwo+PiArfQo+PiAt
LQo+PiAyLjMwLjAKPj4KPj4KPiAKPiAKCi0tIApBbnRvbiBZYWtvdmxldgpTZW5pb3IgU29mdHdh
cmUgRW5naW5lZXIKCk9wZW5TeW5lcmd5IEdtYkgKUm90aGVyc3RyLiAyMCwgMTAyNDUgQmVybGlu
CgpQaG9uZTogKzQ5IDMwIDYwIDk4IDU0IDAKRS1NYWlsOiBhbnRvbi55YWtvdmxldkBvcGVuc3lu
ZXJneS5jb20KCnd3dy5vcGVuc3luZXJneS5jb20KCkhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFs
IFJlZ2lzdHJ5OiBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZywgSFJCIDEwODYxNkIKR2VzY2jD
pGZ0c2bDvGhyZXIvTWFuYWdpbmcgRGlyZWN0b3I6IFJlZ2lzIEFkamFtYWgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
