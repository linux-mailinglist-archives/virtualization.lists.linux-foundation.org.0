Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5029879C
	for <lists.virtualization@lfdr.de>; Mon, 26 Oct 2020 08:50:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65C2A87152;
	Mon, 26 Oct 2020 07:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InN4wyKysIN9; Mon, 26 Oct 2020 07:50:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AFC98714A;
	Mon, 26 Oct 2020 07:50:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 057F5C0051;
	Mon, 26 Oct 2020 07:50:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F2D1C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 07:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A535870FE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 07:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k76A9OsqtZap
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 07:50:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CDA6487029
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 07:50:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9151FAEE0;
 Mon, 26 Oct 2020 07:50:02 +0000 (UTC)
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-11-tzimmermann@suse.de>
 <20201024203838.GB93644@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 10/10] drm/fb_helper: Support framebuffers in I/O memory
Message-ID: <f97902e4-cf8e-17c6-5a6e-b11da41101c5@suse.de>
Date: Mon, 26 Oct 2020 08:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201024203838.GB93644@ravnborg.org>
Content-Language: en-US
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, ray.huang@amd.com, yuq825@gmail.com,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, lima@lists.freedesktop.org,
 oleksandr_andrushchenko@epam.com, krzk@kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, luben.tuikov@amd.com,
 alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 tomeu.vizoso@collabora.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 kyungmin.park@samsung.com, miaoqinglang@huawei.com, kgene@kernel.org,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

SGkKCkFtIDI0LjEwLjIwIHVtIDIyOjM4IHNjaHJpZWIgU2FtIFJhdm5ib3JnOgo+IEhpIFRob21h
cy4KPiAKPiBPbiBUdWUsIE9jdCAyMCwgMjAyMCBhdCAwMjoyMDo0NlBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPj4gQXQgbGVhc3Qgc3BhcmM2NCByZXF1aXJlcyBJL08tc3BlY2lm
aWMgYWNjZXNzIHRvIGZyYW1lYnVmZmVycy4gVGhpcwo+PiBwYXRjaCB1cGRhdGVzIHRoZSBmYmRl
diBjb25zb2xlIGFjY29yZGluZ2x5Lgo+Pgo+PiBGb3IgZHJpdmVycyB3aXRoIGRpcmVjdCBhY2Nl
c3MgdG8gdGhlIGZyYW1lYnVmZmVyIG1lbW9yeSwgdGhlIGNhbGxiYWNrCj4+IGZ1bmN0aW9ucyBp
biBzdHJ1Y3QgZmJfb3BzIHRlc3QgZm9yIHRoZSB0eXBlIG9mIG1lbW9yeSBhbmQgY2FsbCB0aGUg
cnNwCj4+IGZiX3N5c18gb2YgZmJfY2ZiXyBmdW5jdGlvbnMuIFJlYWQgYW5kIHdyaXRlIG9wZXJh
dGlvbnMgYXJlIGltcGxlbWVudGVkCj4+IGludGVybmFsbHkgYnkgRFJNJ3MgZmJkZXYgaGVscGVy
Lgo+Pgo+PiBGb3IgZHJpdmVycyB0aGF0IGVtcGxveSBhIHNoYWRvdyBidWZmZXIsIGZiZGV2J3Mg
YmxpdCBmdW5jdGlvbiByZXRyaWV2ZXMKPj4gdGhlIGZyYW1lYnVmZmVyIGFkZHJlc3MgYXMgc3Ry
dWN0IGRtYV9idWZfbWFwLCBhbmQgdXNlcyBkbWFfYnVmX21hcAo+PiBpbnRlcmZhY2VzIHRvIGFj
Y2VzcyB0aGUgYnVmZmVyLgo+Pgo+PiBUaGUgYm9jaHMgZHJpdmVyIG9uIHNwYXJjNjQgdXNlcyBh
IHdvcmthcm91bmQgdG8gZmxhZyB0aGUgZnJhbWVidWZmZXIgYXMKPj4gSS9PIG1lbW9yeSBhbmQg
YXZvaWQgYSBIVyBleGNlcHRpb24uIFdpdGggdGhlIGludHJvZHVjdGlvbiBvZiBzdHJ1Y3QKPj4g
ZG1hX2J1Zl9tYXAsIHRoaXMgaXMgbm90IHJlcXVpcmVkIGFueSBsb25nZXIuIFRoZSBwYXRjaCBy
ZW1vdmVzIHRoZSByc3AKPj4gY29kZSBmcm9tIGJvdGgsIGJvY2hzIGFuZCBmYmRldi4KPj4KPj4g
djU6Cj4+IAkqIGltcGxlbWVudCBmYl9yZWFkL2ZiX3dyaXRlIGludGVybmFsbHkgKERhbmllbCwg
U2FtKQo+PiB2NDoKPj4gCSogbW92ZSBkbWFfYnVmX21hcCBjaGFuZ2VzIGludG8gc2VwYXJhdGUg
cGF0Y2ggKERhbmllbCkKPj4gCSogVE9ETyBsaXN0OiBjb21tZW50IG9uIGZiZGV2IHVwZGF0ZXMg
KERhbmllbCkKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+Cj4+IFRlc3RlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4gQnV0
IHNlZSBhIGZldyBjb21tZW50cyBiZWxvdyBvbiBuYW1pbmcgZm9yIHlvdSB0byBjb25zaWRlci4K
PiAKPiAJU2FtCj4gCj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAg
IHwgIDE5ICsrLQo+PiAgZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgICAxIC0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgICB8IDIyNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0KPj4gIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICB8
ICAxMiAtLQo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAyMzAgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4+IGluZGV4IDdlNmZjM2MwNGFkZC4uNjM4YjdmNzA0
MzM5IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+PiBAQCAtMTk3LDEzICsxOTcsMjggQEAgQ29udmVy
dCBkcml2ZXJzIHRvIHVzZSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpCj4+ICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gIAo+PiAgTW9zdCBkcml2
ZXJzIGNhbiB1c2UgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKS4gRHJpdmVyIGhhdmUgdG8gaW1w
bGVtZW50Cj4+IC1hdG9taWMgbW9kZXNldHRpbmcgYW5kIEdFTSB2bWFwIHN1cHBvcnQuIEN1cnJl
bnQgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24KPj4gLWV4cGVjdHMgdGhlIGZyYW1lYnVmZmVyIGlu
IHN5c3RlbSBtZW1vcnkgKG9yIHN5c3RlbS1saWtlIG1lbW9yeSkuCj4+ICthdG9taWMgbW9kZXNl
dHRpbmcgYW5kIEdFTSB2bWFwIHN1cHBvcnQuIEhpc3RvcmljYWxseSwgZ2VuZXJpYyBmYmRldiBl
bXVsYXRpb24KPj4gK2V4cGVjdGVkIHRoZSBmcmFtZWJ1ZmZlciBpbiBzeXN0ZW0gbWVtb3J5IG9y
IHN5c3RlbS1saWtlIG1lbW9yeS4gQnkgZW1wbG95aW5nCj4+ICtzdHJ1Y3QgZG1hX2J1Zl9tYXAs
IGRyaXZlcnMgd2l0aCBmcmFtYnVmZmVycyBpbiBJL08gbWVtb3J5IGNhbiBiZSBzdXBwb3J0ZWQK
Pj4gK2FzIHdlbGwuCj4+ICAKPj4gIENvbnRhY3Q6IE1haW50YWluZXIgb2YgdGhlIGRyaXZlciB5
b3UgcGxhbiB0byBjb252ZXJ0Cj4+ICAKPj4gIExldmVsOiBJbnRlcm1lZGlhdGUKPj4gIAo+PiAr
UmVpbXBsZW1lbnQgZnVuY3Rpb25zIGluIGRybV9mYmRldl9mYl9vcHMgd2l0aG91dCBmYmRldgo+
PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+PiArCj4+ICtBIG51bWJlciBvZiBjYWxsYmFjayBmdW5jdGlvbnMgaW4gZHJtX2ZiZGV2X2Zi
X29wcyBjb3VsZCBiZW5lZml0IGZyb20KPj4gK2JlaW5nIHJld3JpdHRlbiB3aXRob3V0IGRlcGVu
ZGVuY2llcyBvbiB0aGUgZmJkZXYgbW9kdWxlLiBTb21lIG9mIHRoZQo+PiAraGVscGVycyBjb3Vs
ZCBmdXJ0aGVyIGJlbmVmaXQgZnJvbSB1c2luZyBzdHJ1Y3QgZG1hX2J1Zl9tYXAgaW5zdGVhZCBv
Zgo+PiArcmF3IHBvaW50ZXJzLgo+PiArCj4+ICtDb250YWN0OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4sIERhbmllbCBWZXR0ZXIKPj4gKwo+PiArTGV2ZWw6IEFkdmFu
Y2VkCj4+ICsKPj4gKwo+PiAgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGFuZCBkcm1fbW9kZV9jb25m
aWdfZnVuY3MuZmJfY3JlYXRlIGNsZWFudXAKPj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
b2Nocy9ib2Noc19rbXMuYwo+PiBpbmRleCAxM2QwZDA0YzQ0NTcuLjg1MzA4MWQxODZkNSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYwo+PiBAQCAtMTUxLDcgKzE1MSw2IEBAIGlu
dCBib2Noc19rbXNfaW5pdChzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocykKPj4gIAlib2Nocy0+
ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAyNDsKPj4gIAlib2Nocy0+ZGV2LT5t
b2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93ID0gMDsKPj4gIAlib2Nocy0+ZGV2LT5tb2RlX2NvbmZp
Zy5wcmVmZXJfc2hhZG93X2ZiZGV2ID0gMTsKPj4gLQlib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5m
YmRldl91c2VfaW9tZW0gPSB0cnVlOwo+PiAgCWJvY2hzLT5kZXYtPm1vZGVfY29uZmlnLnF1aXJr
X2FkZGZiX3ByZWZlcl9ob3N0X2J5dGVfb3JkZXIgPSB0cnVlOwo+PiAgCj4+ICAJYm9jaHMtPmRl
di0+bW9kZV9jb25maWcuZnVuY3MgPSAmYm9jaHNfbW9kZV9mdW5jczsKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jCj4+IGluZGV4IDYyMTJjZDdjZGUxZC4uMWQzMTgwODQxNzc4IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmMKPj4gQEAgLTM3MiwyNCArMzcyLDIyIEBAIHN0YXRpYyB2b2lk
IGRybV9mYl9oZWxwZXJfcmVzdW1lX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+
ICB9Cj4+ICAKPj4gIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGlydHlfYmxpdF9yZWFsKHN0
cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsCj4+IC0JCQkJCSAgc3RydWN0IGRybV9jbGlw
X3JlY3QgKmNsaXApCj4+ICsJCQkJCSAgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXAsCj4+ICsJ
CQkJCSAgc3RydWN0IGRtYV9idWZfbWFwICpkc3QpCj4+ICB7Cj4+ICAJc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIgPSBmYl9oZWxwZXItPmZiOwo+PiAgCXVuc2lnbmVkIGludCBjcHAgPSBmYi0+
Zm9ybWF0LT5jcHBbMF07Cj4+ICAJc2l6ZV90IG9mZnNldCA9IGNsaXAtPnkxICogZmItPnBpdGNo
ZXNbMF0gKyBjbGlwLT54MSAqIGNwcDsKPj4gIAl2b2lkICpzcmMgPSBmYl9oZWxwZXItPmZiZGV2
LT5zY3JlZW5fYnVmZmVyICsgb2Zmc2V0Owo+PiAtCXZvaWQgKmRzdCA9IGZiX2hlbHBlci0+YnVm
ZmVyLT5tYXAudmFkZHIgKyBvZmZzZXQ7Cj4+ICAJc2l6ZV90IGxlbiA9IChjbGlwLT54MiAtIGNs
aXAtPngxKSAqIGNwcDsKPj4gIAl1bnNpZ25lZCBpbnQgeTsKPj4gIAo+PiAtCWZvciAoeSA9IGNs
aXAtPnkxOyB5IDwgY2xpcC0+eTI7IHkrKykgewo+PiAtCQlpZiAoIWZiX2hlbHBlci0+ZGV2LT5t
b2RlX2NvbmZpZy5mYmRldl91c2VfaW9tZW0pCj4+IC0JCQltZW1jcHkoZHN0LCBzcmMsIGxlbik7
Cj4+IC0JCWVsc2UKPj4gLQkJCW1lbWNweV90b2lvKCh2b2lkIF9faW9tZW0gKilkc3QsIHNyYywg
bGVuKTsKPj4gKwlkbWFfYnVmX21hcF9pbmNyKGRzdCwgb2Zmc2V0KTsgLyogZ28gdG8gZmlyc3Qg
cGl4ZWwgd2l0aGluIGNsaXAgcmVjdCAqLwo+PiAgCj4+ICsJZm9yICh5ID0gY2xpcC0+eTE7IHkg
PCBjbGlwLT55MjsgeSsrKSB7Cj4+ICsJCWRtYV9idWZfbWFwX21lbWNweV90byhkc3QsIHNyYywg
bGVuKTsKPj4gKwkJZG1hX2J1Zl9tYXBfaW5jcihkc3QsIGZiLT5waXRjaGVzWzBdKTsKPj4gIAkJ
c3JjICs9IGZiLT5waXRjaGVzWzBdOwo+PiAtCQlkc3QgKz0gZmItPnBpdGNoZXNbMF07Cj4+ICAJ
fQo+PiAgfQo+PiAgCj4+IEBAIC00MTcsOCArNDE1LDkgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hl
bHBlcl9kaXJ0eV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPj4gIAkJCXJldCA9IGRy
bV9jbGllbnRfYnVmZmVyX3ZtYXAoaGVscGVyLT5idWZmZXIsICZtYXApOwo+PiAgCQkJaWYgKHJl
dCkKPj4gIAkJCQlyZXR1cm47Cj4+IC0JCQlkcm1fZmJfaGVscGVyX2RpcnR5X2JsaXRfcmVhbCho
ZWxwZXIsICZjbGlwX2NvcHkpOwo+PiArCQkJZHJtX2ZiX2hlbHBlcl9kaXJ0eV9ibGl0X3JlYWwo
aGVscGVyLCAmY2xpcF9jb3B5LCAmbWFwKTsKPj4gIAkJfQo+PiArCj4+ICAJCWlmIChoZWxwZXIt
PmZiLT5mdW5jcy0+ZGlydHkpCj4+ICAJCQloZWxwZXItPmZiLT5mdW5jcy0+ZGlydHkoaGVscGVy
LT5mYiwgTlVMTCwgMCwgMCwKPj4gIAkJCQkJCSAmY2xpcF9jb3B5LCAxKTsKPj4gQEAgLTIwMjcs
NiArMjAyNiwyMDYgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZmJfbW1hcChzdHJ1Y3QgZmJfaW5m
byAqaW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4+ICAJCXJldHVybiAtRU5PREVW
Owo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgYm9vbCBkcm1fZmJkZXZfdXNlX2lvbWVtKHN0cnVjdCBm
Yl9pbmZvICppbmZvKQo+PiArewo+PiArCXN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIg
PSBpbmZvLT5wYXI7Cj4+ICsJc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIgPSBmYl9o
ZWxwZXItPmJ1ZmZlcjsKPj4gKwo+PiArCXJldHVybiAhZHJtX2ZiZGV2X3VzZV9zaGFkb3dfZmIo
ZmJfaGVscGVyKSAmJiBidWZmZXItPm1hcC5pc19pb21lbTsKPj4gK30KPj4gKwo+PiArc3RhdGlj
IHNzaXplX3QgZmJfcmVhZF9zY3JlZW5fYmFzZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBf
X3VzZXIgKmJ1Ziwgc2l6ZV90IGNvdW50LCAKPj4gKwkJCQkgICBsb2ZmX3QgcG9zKQo+IFRoZSBu
YW1pbmcgaGVyZSBjb25mdXNlZCBtZSAtIGEgbmFtZSBsaWtlOgo+IGZiX3JlYWRfaW9tZW0oKSB3
b3VsZCBoYXZlIGhlbHBlZCBtZSBtb3JlLgo+IFdpdGggdGhlIGN1cnJlbnQgbmFtaW5nIEkgc2hh
bGwgcmVtZW1iZXIgdGhhdCB0aGUgc2NyZWVuX2Jhc2UgbWVtYmVyIGlzCj4gdGhlIGlvbWVtIHBv
aW50ZXIuCgpZZWFoLCB0cnVlLiBJbiB0ZXJtcyBvZiBuYW1pbmcsIEkgd2FzIHVuZGVjaWRlZC4g
SSB3YXMgdGhpbmtpbmcgYWJvdXQKYWRvcHRpbmcgYSBuYW1pbmcgc2ltaWxhciB0byB3aGF0IHlv
dSBkZXNjcmliZSwgYnV0IE9UT0ggd2UgZG9uJ3QgdXNlCnN5c21lbSBhbnl3aGVyZSBpbiB0aGUg
Y29kZS4gSSB0aG91Z2h0IGFib3V0IGFkb3B0aW5nIGZiZGV2J3MgY29uZW50aW9uCm9mIHVzaW5n
IF9zeXNfIGFuZCBfY2ZiXy4gQnV0IHRoYXQgd291bGQgbWFrZSBzZW5zZWluIHRoZSBsb2NhbCBj
b250ZXh0LgoKPiAKPj4gK3sKPj4gKwljb25zdCBjaGFyIF9faW9tZW0gKnNyYyA9IGluZm8tPnNj
cmVlbl9iYXNlICsgcG9zOwo+PiArCXNpemVfdCBhbGxvY19zaXplID0gbWluKGNvdW50LCBQQUdF
X1NJWkUpOwo+PiArCXNzaXplX3QgcmV0ID0gMDsKPj4gKwljaGFyICp0bXA7Cj4+ICsKPj4gKwl0
bXAgPSBrbWFsbG9jKGFsbG9jX3NpemUsIEdGUF9LRVJORUwpOwo+PiArCWlmICghdG1wKQo+PiAr
CQlyZXR1cm4gLUVOT01FTTsKPj4gKwo+IAo+IEkgbG9va2VkIGFyb3VuZCBhbmQgY291bGQgbm90
IGZpbmQgb3RoZXIgcGxhY2VzIHdoZXJlCj4gd2UgY29weSBmcm9tIGlvbWVtIHRvIG1lbSB0byB1
c2VybWVtIGluIGNodW5rcyBvZiBQQUdFX1NJWkUuCgpJIHRvb2sgdGhpcyBwYXR0ZXJuIGZyb20g
ZmJkZXYncyBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbi4gSSB0aGluayBpdCdzCmRvbmUgdG8gd29y
ayBuaWNlbHkgd2l0aCBrbWFsbG9jLgoKQmVzdCByZWdhcmRzClRob21hcwoKPiAKPj4gKwl3aGls
ZSAoY291bnQpIHsKPj4gKwkJc2l6ZV90IGMgPSBtaW4oY291bnQsIGFsbG9jX3NpemUpOwo+PiAr
Cj4+ICsJCW1lbWNweV9mcm9taW8odG1wLCBzcmMsIGMpOwo+PiArCQlpZiAoY29weV90b191c2Vy
KGJ1ZiwgdG1wLCBjKSkgewo+PiArCQkJcmV0ID0gLUVGQVVMVDsKPj4gKwkJCWJyZWFrOwo+PiAr
CQl9Cj4+ICsKPj4gKwkJc3JjICs9IGM7Cj4+ICsJCWJ1ZiArPSBjOwo+PiArCQlyZXQgKz0gYzsK
Pj4gKwkJY291bnQgLT0gYzsKPj4gKwl9Cj4+ICsKPj4gKwlrZnJlZSh0bXApOwo+PiArCj4+ICsJ
cmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXplX3QgZmJfcmVhZF9zY3JlZW5f
YnVmZmVyKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3QgY291
bnQsCj4+ICsJCQkJICAgICBsb2ZmX3QgcG9zKQo+IEFuZCBmYl9yZWFkX3N5c21lbSgpIGhlcmUu
Cj4gCj4+ICt7Cj4+ICsJY29uc3QgY2hhciAqc3JjID0gaW5mby0+c2NyZWVuX2J1ZmZlciArIHBv
czsKPj4gKwo+PiArCWlmIChjb3B5X3RvX3VzZXIoYnVmLCBzcmMsIGNvdW50KSkKPj4gKwkJcmV0
dXJuIC1FRkFVTFQ7Cj4+ICsKPj4gKwlyZXR1cm4gY291bnQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRp
YyBzc2l6ZV90IGRybV9mYmRldl9mYl9yZWFkKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjaGFyIF9f
dXNlciAqYnVmLAo+PiArCQkJCSBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykKPj4gK3sKPj4g
Kwlsb2ZmX3QgcG9zID0gKnBwb3M7Cj4+ICsJc2l6ZV90IHRvdGFsX3NpemU7Cj4+ICsJc3NpemVf
dCByZXQ7Cj4+ICsKPj4gKwlpZiAoaW5mby0+c3RhdGUgIT0gRkJJTkZPX1NUQVRFX1JVTk5JTkcp
Cj4+ICsJCXJldHVybiAtRVBFUk07Cj4+ICsKPj4gKwlpZiAoaW5mby0+c2NyZWVuX3NpemUpCj4+
ICsJCXRvdGFsX3NpemUgPSBpbmZvLT5zY3JlZW5fc2l6ZTsKPj4gKwllbHNlCj4+ICsJCXRvdGFs
X3NpemUgPSBpbmZvLT5maXguc21lbV9sZW47Cj4+ICsKPj4gKwlpZiAocG9zID49IHRvdGFsX3Np
emUpCj4+ICsJCXJldHVybiAwOwo+PiArCWlmIChjb3VudCA+PSB0b3RhbF9zaXplKQo+PiArCQlj
b3VudCA9IHRvdGFsX3NpemU7Cj4+ICsJaWYgKHRvdGFsX3NpemUgLSBjb3VudCA8IHBvcykKPj4g
KwkJY291bnQgPSB0b3RhbF9zaXplIC0gcG9zOwo+PiArCj4+ICsJaWYgKGRybV9mYmRldl91c2Vf
aW9tZW0oaW5mbykpCj4+ICsJCXJldCA9IGZiX3JlYWRfc2NyZWVuX2Jhc2UoaW5mbywgYnVmLCBj
b3VudCwgcG9zKTsKPj4gKwllbHNlCj4+ICsJCXJldCA9IGZiX3JlYWRfc2NyZWVuX2J1ZmZlcihp
bmZvLCBidWYsIGNvdW50LCBwb3MpOwo+PiArCj4+ICsJaWYgKHJldCA+IDApCj4+ICsJCSpwcG9z
ID0gcmV0Owo+PiArCj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXpl
X3QgZmJfd3JpdGVfc2NyZWVuX2Jhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNoYXIg
X191c2VyICpidWYsIHNpemVfdCBjb3VudCwKPj4gKwkJCQkgICAgbG9mZl90IHBvcykKPiAKPiBm
Yl93cml0ZV9pb21lbSgpCj4gCj4+ICt7Cj4+ICsJY2hhciBfX2lvbWVtICpkc3QgPSBpbmZvLT5z
Y3JlZW5fYmFzZSArIHBvczsKPj4gKwlzaXplX3QgYWxsb2Nfc2l6ZSA9IG1pbihjb3VudCwgUEFH
RV9TSVpFKTsKPj4gKwlzc2l6ZV90IHJldCA9IDA7Cj4+ICsJdTggKnRtcDsKPj4gKwo+PiArCXRt
cCA9IGttYWxsb2MoYWxsb2Nfc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYgKCF0bXApCj4+ICsJ
CXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJd2hpbGUgKGNvdW50KSB7Cj4+ICsJCXNpemVfdCBj
ID0gbWluKGNvdW50LCBhbGxvY19zaXplKTsKPj4gKwo+PiArCQlpZiAoY29weV9mcm9tX3VzZXIo
dG1wLCBidWYsIGMpKSB7Cj4+ICsJCQlyZXQgPSAtRUZBVUxUOwo+PiArCQkJYnJlYWs7Cj4+ICsJ
CX0KPj4gKwkJbWVtY3B5X3RvaW8oZHN0LCB0bXAsIGMpOwo+PiArCj4+ICsJCWRzdCArPSBjOwo+
PiArCQlidWYgKz0gYzsKPj4gKwkJcmV0ICs9IGM7Cj4+ICsJCWNvdW50IC09IGM7Cj4+ICsJfQo+
PiArCj4+ICsJa2ZyZWUodG1wKTsKPj4gKwo+PiArCXJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4g
K3N0YXRpYyBzc2l6ZV90IGZiX3dyaXRlX3NjcmVlbl9idWZmZXIoc3RydWN0IGZiX2luZm8gKmlu
Zm8sIGNvbnN0IGNoYXIgX191c2VyICpidWYsIHNpemVfdCBjb3VudCwKPj4gKwkJCQkgICAgICBs
b2ZmX3QgcG9zKQo+IGZiX3dyaXRlX3N5c21lbSgpCj4gCj4+ICt7Cj4+ICsJY2hhciAqZHN0ID0g
aW5mby0+c2NyZWVuX2J1ZmZlciArIHBvczsKPj4gKwo+PiArCWlmIChjb3B5X2Zyb21fdXNlcihk
c3QsIGJ1ZiwgY291bnQpKQo+PiArCQlyZXR1cm4gLUVGQVVMVDsKPj4gKwo+PiArCXJldHVybiBj
b3VudDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXplX3QgZHJtX2ZiZGV2X2ZiX3dyaXRlKHN0
cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAo+PiArCQkJCSAgc2l6
ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpCj4+ICt7Cj4+ICsJbG9mZl90IHBvcyA9ICpwcG9zOwo+
PiArCXNpemVfdCB0b3RhbF9zaXplOwo+PiArCXNzaXplX3QgcmV0Owo+PiArCWludCBlcnI7Cj4+
ICsKPj4gKwlpZiAoaW5mby0+c3RhdGUgIT0gRkJJTkZPX1NUQVRFX1JVTk5JTkcpCj4+ICsJCXJl
dHVybiAtRVBFUk07Cj4+ICsKPj4gKwlpZiAoaW5mby0+c2NyZWVuX3NpemUpCj4+ICsJCXRvdGFs
X3NpemUgPSBpbmZvLT5zY3JlZW5fc2l6ZTsKPj4gKwllbHNlCj4+ICsJCXRvdGFsX3NpemUgPSBp
bmZvLT5maXguc21lbV9sZW47Cj4+ICsKPj4gKwlpZiAocG9zID4gdG90YWxfc2l6ZSkKPj4gKwkJ
cmV0dXJuIC1FRkJJRzsKPj4gKwlpZiAoY291bnQgPiB0b3RhbF9zaXplKSB7Cj4+ICsJCWVyciA9
IC1FRkJJRzsKPj4gKwkJY291bnQgPSB0b3RhbF9zaXplOwo+PiArCX0KPj4gKwlpZiAodG90YWxf
c2l6ZSAtIGNvdW50IDwgcG9zKSB7Cj4+ICsJCWlmICghZXJyKQo+PiArCQkJZXJyID0gLUVOT1NQ
QzsKPj4gKwkJY291bnQgPSB0b3RhbF9zaXplIC0gcG9zOwo+PiArCX0KPj4gKwo+PiArCS8qCj4+
ICsJICogQ29weSB0byBmcmFtZWJ1ZmZlciBldmVuIGlmIHdlIGFscmVhZHkgbG9nZ2VkIGFuIGVy
cm9yLiBFbXVsYXRlcwo+PiArCSAqIHRoZSBiZWhhdmlvciBvZiB0aGUgb3JpZ2luYWwgZmJkZXYg
aW1wbGVtZW50YXRpb24uCj4+ICsJICovCj4+ICsJaWYgKGRybV9mYmRldl91c2VfaW9tZW0oaW5m
bykpCj4+ICsJCXJldCA9IGZiX3dyaXRlX3NjcmVlbl9iYXNlKGluZm8sIGJ1ZiwgY291bnQsIHBv
cyk7Cj4+ICsJZWxzZQo+PiArCQlyZXQgPSBmYl93cml0ZV9zY3JlZW5fYnVmZmVyKGluZm8sIGJ1
ZiwgY291bnQsIHBvcyk7Cj4+ICsKPj4gKwlpZiAocmV0ID4gMCkKPj4gKwkJKnBwb3MgPSByZXQ7
Cj4+ICsKPj4gKwlpZiAoZXJyKQo+PiArCQlyZXR1cm4gZXJyOwo+PiArCj4+ICsJcmV0dXJuIHJl
dDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgZHJtX2ZiZGV2X2ZiX2ZpbGxyZWN0KHN0cnVj
dCBmYl9pbmZvICppbmZvLAo+PiArCQkJCSAgY29uc3Qgc3RydWN0IGZiX2ZpbGxyZWN0ICpyZWN0
KQo+PiArewo+PiArCWlmIChkcm1fZmJkZXZfdXNlX2lvbWVtKGluZm8pKQo+PiArCQlkcm1fZmJf
aGVscGVyX2NmYl9maWxscmVjdChpbmZvLCByZWN0KTsKPj4gKwllbHNlCj4+ICsJCWRybV9mYl9o
ZWxwZXJfc3lzX2ZpbGxyZWN0KGluZm8sIHJlY3QpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9p
ZCBkcm1fZmJkZXZfZmJfY29weWFyZWEoc3RydWN0IGZiX2luZm8gKmluZm8sCj4+ICsJCQkJICBj
b25zdCBzdHJ1Y3QgZmJfY29weWFyZWEgKmFyZWEpCj4+ICt7Cj4+ICsJaWYgKGRybV9mYmRldl91
c2VfaW9tZW0oaW5mbykpCj4+ICsJCWRybV9mYl9oZWxwZXJfY2ZiX2NvcHlhcmVhKGluZm8sIGFy
ZWEpOwo+PiArCWVsc2UKPj4gKwkJZHJtX2ZiX2hlbHBlcl9zeXNfY29weWFyZWEoaW5mbywgYXJl
YSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGRybV9mYmRldl9mYl9pbWFnZWJsaXQoc3Ry
dWN0IGZiX2luZm8gKmluZm8sCj4+ICsJCQkJICAgY29uc3Qgc3RydWN0IGZiX2ltYWdlICppbWFn
ZSkKPj4gK3sKPj4gKwlpZiAoZHJtX2ZiZGV2X3VzZV9pb21lbShpbmZvKSkKPj4gKwkJZHJtX2Zi
X2hlbHBlcl9jZmJfaW1hZ2VibGl0KGluZm8sIGltYWdlKTsKPj4gKwllbHNlCj4+ICsJCWRybV9m
Yl9oZWxwZXJfc3lzX2ltYWdlYmxpdChpbmZvLCBpbWFnZSk7Cj4+ICt9Cj4+ICsKPj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGRybV9mYmRldl9mYl9vcHMgPSB7Cj4+ICAJLm93bmVyCQk9
IFRISVNfTU9EVUxFLAo+PiAgCURSTV9GQl9IRUxQRVJfREVGQVVMVF9PUFMsCj4+IEBAIC0yMDM0
LDExICsyMjMzLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGRybV9mYmRldl9mYl9v
cHMgPSB7Cj4+ICAJLmZiX3JlbGVhc2UJPSBkcm1fZmJkZXZfZmJfcmVsZWFzZSwKPj4gIAkuZmJf
ZGVzdHJveQk9IGRybV9mYmRldl9mYl9kZXN0cm95LAo+PiAgCS5mYl9tbWFwCT0gZHJtX2ZiZGV2
X2ZiX21tYXAsCj4+IC0JLmZiX3JlYWQJPSBkcm1fZmJfaGVscGVyX3N5c19yZWFkLAo+PiAtCS5m
Yl93cml0ZQk9IGRybV9mYl9oZWxwZXJfc3lzX3dyaXRlLAo+PiAtCS5mYl9maWxscmVjdAk9IGRy
bV9mYl9oZWxwZXJfc3lzX2ZpbGxyZWN0LAo+PiAtCS5mYl9jb3B5YXJlYQk9IGRybV9mYl9oZWxw
ZXJfc3lzX2NvcHlhcmVhLAo+PiAtCS5mYl9pbWFnZWJsaXQJPSBkcm1fZmJfaGVscGVyX3N5c19p
bWFnZWJsaXQsCj4+ICsJLmZiX3JlYWQJPSBkcm1fZmJkZXZfZmJfcmVhZCwKPj4gKwkuZmJfd3Jp
dGUJPSBkcm1fZmJkZXZfZmJfd3JpdGUsCj4+ICsJLmZiX2ZpbGxyZWN0CT0gZHJtX2ZiZGV2X2Zi
X2ZpbGxyZWN0LAo+PiArCS5mYl9jb3B5YXJlYQk9IGRybV9mYmRldl9mYl9jb3B5YXJlYSwKPj4g
KwkuZmJfaW1hZ2VibGl0CT0gZHJtX2ZiZGV2X2ZiX2ltYWdlYmxpdCwKPj4gIH07Cj4+ICAKPj4g
IHN0YXRpYyBzdHJ1Y3QgZmJfZGVmZXJyZWRfaW8gZHJtX2ZiZGV2X2RlZmlvID0gewo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggYi9pbmNsdWRlL2RybS9kcm1f
bW9kZV9jb25maWcuaAo+PiBpbmRleCA1ZmZiYjRlZDViMzUuLmFiNDI0ZGRkNzY2NSAxMDA2NDQK
Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX21vZGVfY29uZmlnLmgKPj4gQEAgLTg3NywxOCArODc3LDYgQEAgc3RydWN0IGRybV9t
b2RlX2NvbmZpZyB7Cj4+ICAJICovCj4+ICAJYm9vbCBwcmVmZXJfc2hhZG93X2ZiZGV2Owo+PiAg
Cj4+IC0JLyoqCj4+IC0JICogQGZiZGV2X3VzZV9pb21lbToKPj4gLQkgKgo+PiAtCSAqIFNldCB0
byB0cnVlIGlmIGZyYW1lYnVmZmVyIHJlc2lkZSBpbiBpb21lbS4KPj4gLQkgKiBXaGVuIHNldCB0
byB0cnVlIG1lbWNweV90b2lvKCkgaXMgdXNlZCB3aGVuIGNvcHlpbmcgdGhlIGZyYW1lYnVmZmVy
IGluCj4+IC0JICogZHJtX2ZiX2hlbHBlci5kcm1fZmJfaGVscGVyX2RpcnR5X2JsaXRfcmVhbCgp
Lgo+PiAtCSAqCj4+IC0JICogRklYTUU6IFRoaXMgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggYSBw
ZXItbWFwcGluZyBpc19pb21lbQo+PiAtCSAqIGZsYWcgKGxpa2UgdHRtIGRvZXMpLCBhbmQgdGhl
biB1c2VkIGV2ZXJ5d2hlcmUgaW4gZmJkZXYgY29kZS4KPj4gLQkgKi8KPj4gLQlib29sIGZiZGV2
X3VzZV9pb21lbTsKPj4gLQo+PiAgCS8qKgo+PiAgCSAqIEBxdWlya19hZGRmYl9wcmVmZXJfeGJn
cl8zMGJwcDoKPj4gIAkgKgo+PiAtLSAKPj4gMi4yOC4wCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKVGhvbWFzIFppbW1lcm1hbm4K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
