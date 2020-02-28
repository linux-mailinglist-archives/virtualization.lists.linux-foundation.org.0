Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A0173E2E
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 18:17:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 640C486ED0;
	Fri, 28 Feb 2020 17:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wt9_v_EL_8u7; Fri, 28 Feb 2020 17:17:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B40DC86EC4;
	Fri, 28 Feb 2020 17:17:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55F9FC0177;
	Fri, 28 Feb 2020 17:17:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 777B0C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6506486EC1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM0y5e3Ad6lG
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3269A86EC0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:16:57 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01SHGnJB027625
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 18:16:49 +0100
Received: from [139.25.68.37] ([139.25.68.37])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01SHGn7k011338;
 Fri, 28 Feb 2020 18:16:49 +0100
Subject: Re: VIRTIO adoption in other hypervisors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <87mu93vwy2.fsf@linaro.org>
 <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
 <0b80da21-ed40-c550-c605-031a209115b1@siemens.com>
 <878skmwtei.fsf@linaro.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a64fd962-8b62-58d9-9fe3-cc2aa686ac02@siemens.com>
Date: Fri, 28 Feb 2020 18:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <878skmwtei.fsf@linaro.org>
Content-Language: en-US
Cc: Wei Liu <liuw@liuw.name>, virtio-dev@lists.oasis-open.org,
 Stefano Stabellini <sstabellini@kernel.org>,
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

T24gMjguMDIuMjAgMTc6NDcsIEFsZXggQmVubsOpZSB3cm90ZToKPiAKPiBKYW4gS2lzemthIDxq
YW4ua2lzemthQHNpZW1lbnMuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDI4LjAyLjIwIDExOjMwLCBK
YW4gS2lzemthIHdyb3RlOgo+Pj4gT24gMjguMDIuMjAgMTE6MTYsIEFsZXggQmVubsOpZSB3cm90
ZToKPj4+PiBIaSwKPj4+Pgo+IDxzbmlwPgo+Pj4+IEkgYmVsaWV2ZSB0aGVyZSBoYXMgYmVlbiBz
b21lIGRldmVsb3BtZW50IHdvcmsgZm9yIHN1cHBvcnRpbmcgVklSVElPIG9uCj4+Pj4gWGVuIGFs
dGhvdWdoIGl0IHNlZW1zIHRvIGhhdmUgc3RhbGxlZCBhY2NvcmRpbmcgdG86Cj4+Pj4KPj4+PiAg
ICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvVmlydGlvX09uX1hlbgo+Pj4+Cj4+
Pj4gUmVjZW50bHkgYXQgS1ZNIEZvcnVtIHRoZXJlIHdhcyBKYW4ncyB0YWxrIGFib3V0IEludGVy
LVZNIHNoYXJlZCBtZW1vcnkKPj4+PiB3aGljaCBwcm9wb3NlZCBpdnNobWVtdjIgYXMgYSBWSVJU
SU8gdHJhbnNwb3J0Ogo+Pj4+Cj4+Pj4gICAgIGh0dHBzOi8vZXZlbnRzMTkubGludXhmb3VuZGF0
aW9uLm9yZy9ldmVudHMva3ZtLWZvcnVtLTIwMTkvcHJvZ3JhbS9zY2hlZHVsZS8KPj4+Pgo+Pj4+
Cj4+Pj4gQXMgSSB1bmRlcnN0b29kIGl0IHRoaXMgd291bGQgYWxsb3cgWGVuIChhbmQgb3RoZXIg
aHlwZXJ2aXNvcnMpIGEgc2ltcGxlCj4+Pj4gd2F5IHRvIGJlIGFibGUgdG8gY2FycnkgdmlydGlv
IHRyYWZmaWMgYmV0d2VlbiBndWVzdCBhbmQgZW5kIHBvaW50Lgo+Pgo+PiBBbmQgdG8gY2xhcmlm
eSB0aGUgc2NvcGUgb2YgdGhpcyBlZmZvcnQ6IHZpcnRpby1vdmVyLWl2c2htZW0gaXMgbm90Cj4+
IHRoZSBmYXN0ZXN0IG9wdGlvbiB0byBvZmZlciB2aXJ0aW8gdG8gYSBndWVzdCAoc3RhdGljICJE
TUEiIHdpbmRvdyksCj4+IGJ1dCBpdCBpcyB0aGUgc2ltcGxlc3Qgb25lIGZyb20gdGhlIGh5cGVy
dmlzb3IgUG9WIGFuZCwgdGh1cywgYWxzbwo+PiBsaWtlbHkgdGhlIGVhc2llc3Qgb25lIHRvIGFy
Z3VlIG92ZXIgd2hlbiBpdCBjb21lcyB0byBzZWN1cml0eSBhbmQKPj4gc2FmZXR5Lgo+IAo+IFNv
IHRvIGRyaWxsIGRvd24gb24gdGhpcyBpcyB0aGlzIGEgcGFydGljdWxhciBwcm9ibGVtIHdpdGgg
dHlwZS0xCj4gaHlwZXJ2aXNvcnM/CgpXZWxsLCB0aGlzIHR5cGluZyBkb2Vzbid0IGhlbHAgaGVy
ZSAobGlrZSBpdCByYXJlbHkgZG9lcykuIFRoZXJlIGFyZSAKa3ZtLWJhc2VkIHNldHVwcyB0aGF0
IGFyZSBzdHJpcHBlZCBkb3duIGFuZCBoYXJkZW5lZCBpbiBhIHdheSB3aGVyZSAKb3RoZXIgZm9s
a3Mgd291bGQgcmF0aGVyIHRoaW5rIG9mICJ0eXBlIDEiLiBJIGp1c3QgaGFkIGEgZGlzY3Vzc2lv
biAKYXJvdW5kIHN1Y2ggYSBtb2RlbCBmb3IgYSBjbG91ZCBzY2VuYXJpbyB0aGF0IHJ1bnMgb24g
a3ZtLgoKPiAKPiBJdCBzZWVtcyB0byBtZSBhbnkgS1ZNLWxpa2UgcnVuIGxvb3AgdHJpdmlhbGx5
IHN1cHBvcnRzIGEgcmFuZ2Ugb2YKPiB2aXJ0aW8gZGV2aWNlcyBieSB2aXJ0dWUgb2YgdHJhcHBp
bmcgYWNjZXNzZXMgdG8gdGhlIHNpZ25hbGxpbmcgYXJlYSBvZgo+IGEgdmlydHF1ZXVlIGFuZCBh
bGxvd2luZyB0aGUgVk1NIHRvIGhhbmRsZSB0aGUgdHJhbnNhY3Rpb24gd2hpY2ggZXZlcgo+IHdh
eSBpdCBzZWVzIGZpdC4KPiAKPiBJJ3ZlIG5vdCBxdWl0ZSB1bmRlcnN0b29kIHRoZSB3YXkgWGVu
IGludGVyZmFjZXMgdG8gUUVNVSBhc2lkZSBmcm9tIGl0J3MKPiBkaWZmZXJlbnQgdG8gZXZlcnl0
aGluZyBlbHNlLiBNb3JlIG92ZXIgaXQgc2VlbXMgdGhlIHR5cGUtMSBoeXBlcnZpc29ycwo+IGFy
ZSBtb3JlIGludGVyZXN0ZWQgaW4gcHJvdmlkaW5nIGJldHRlciBpc29sYXRpb24gYmV0d2VlbiBz
ZWdtZW50cyBvZiBhCj4gc3lzdGVtIHdoZXJlYXMgVklSVElPIGN1cnJlbnRseSBhc3N1bWVzIGVp
dGhlciB0aGUgVk1NIG9yIHRoZSBoeXBlcnZpc29yCj4gaGFzIGZ1bGwgYWNjZXNzIHRoZSBmdWxs
IGd1ZXN0IGFkZHJlc3Mgc3BhY2UuIEkndmUgc2VlbiBxdWl0ZSBhIGxvdCBvZgo+IHNsaWRlcyB0
aGF0IHdhbnQgdG8gaXNvbGF0ZSBzZWN0aW9ucyBvZiBkZXZpY2UgZW11bGF0aW9uIHRvIHNlcGFy
YXRlCj4gcHJvY2Vzc2VzIG9yIGV2ZW4gc2VwYXJhdGUgZ3Vlc3QgVk1zLgoKVGhlIHBvaW50IGlz
IGluIGZhY3Qgbm90IG9ubHkgd2hldGhlciB0byB0cmFwIElPIGFjY2Vzc2VzIG9yIHRvIGFzayB0
aGUgCmd1ZXN0IHRvIHJhdGhlciB0YXJnZXQgc29tZXRoaW5nIGxpa2UgaXZzaG1lbSAoaW4gZmFj
dCwgdGhhdCBpcyB3aGVyZSAKdXNlIGNhc2VzIEkgaGF2ZSBpbiBtaW5kIGRldmlhdGVkIGZyb20g
dGhvc2Ugb2YgdGhhdCBjbG91ZCBvcGVyYXRvcikuIEl0IAppcyBzcGVjaWZpY2FsbHkgdGhlIHF1
ZXN0aW9uIGhvdyB0aGUgYmFja2VuZCBzaG91bGQgYmUgYWJsZSB0byB0cmFuc2ZlciAKZGF0YSB0
by9mcm9tIHRoZSBmcm9udGVuZC4gSWYgeW91IHdhbnQgdG8gaXNvbGF0ZSB0aGUgYm90aCBmcm9t
IGVhY2ggCm90aGVyIChkcml2ZXIgVk1zL2RvbWFpbnMvZXRjLiksIHlvdSBlaXRoZXIgbmVlZCBh
IGNvbXBsZXggdmlydHVhbCBJT01NVSAKKG9yICJncmFudCB0YWJsZXMiKSBvciBhIHN0YXRpYyBE
TUEgd2luZG93cyAobGlrZSBpdnNobWVtKS4gVGhlIGZvcm1lciAKaXMgbW9yZSBlZmZpY2llbnQg
d2l0aCBsYXJnZSB0cmFuc2ZlcnMsIHRoZSBsYXR0ZXIgaXMgbXVjaCBzaW1wbGVyIGFuZCAKdGhl
cmVmb3JlIG1vcmUgcm9idXN0LgoKSmFuCgotLSAKU2llbWVucyBBRywgQ29ycG9yYXRlIFRlY2hu
b2xvZ3ksIENUIFJEQSBJT1QgU0VTLURFCkNvcnBvcmF0ZSBDb21wZXRlbmNlIENlbnRlciBFbWJl
ZGRlZCBMaW51eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
