Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BD173DF1
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 18:09:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01B9D81B7E;
	Fri, 28 Feb 2020 17:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bI2QF-4PwRR; Fri, 28 Feb 2020 17:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6178281B86;
	Fri, 28 Feb 2020 17:08:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 539E2C0177;
	Fri, 28 Feb 2020 17:08:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D979BC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C8EE020407
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQBTm3Ef8SNZ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:08:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A39620369
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 17:08:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C56E7AFEC;
 Fri, 28 Feb 2020 17:08:53 +0000 (UTC)
Subject: Re: VIRTIO adoption in other hypervisors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>
References: <87mu93vwy2.fsf@linaro.org>
 <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
 <0b80da21-ed40-c550-c605-031a209115b1@siemens.com>
 <878skmwtei.fsf@linaro.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2a8b2d4f-28f0-7f03-744d-c8f03d50e383@suse.com>
Date: Fri, 28 Feb 2020 18:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <878skmwtei.fsf@linaro.org>
Content-Language: en-US
Cc: virtio-dev@lists.oasis-open.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 virtualization@lists.linux-foundation.org, Wei Liu <liuw@liuw.name>
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
dHlwZS0xCj4gaHlwZXJ2aXNvcnM/Cj4gCj4gSXQgc2VlbXMgdG8gbWUgYW55IEtWTS1saWtlIHJ1
biBsb29wIHRyaXZpYWxseSBzdXBwb3J0cyBhIHJhbmdlIG9mCj4gdmlydGlvIGRldmljZXMgYnkg
dmlydHVlIG9mIHRyYXBwaW5nIGFjY2Vzc2VzIHRvIHRoZSBzaWduYWxsaW5nIGFyZWEgb2YKPiBh
IHZpcnRxdWV1ZSBhbmQgYWxsb3dpbmcgdGhlIFZNTSB0byBoYW5kbGUgdGhlIHRyYW5zYWN0aW9u
IHdoaWNoIGV2ZXIKPiB3YXkgaXQgc2VlcyBmaXQuCj4gCj4gSSd2ZSBub3QgcXVpdGUgdW5kZXJz
dG9vZCB0aGUgd2F5IFhlbiBpbnRlcmZhY2VzIHRvIFFFTVUgYXNpZGUgZnJvbSBpdCdzCj4gZGlm
ZmVyZW50IHRvIGV2ZXJ5dGhpbmcgZWxzZS4gTW9yZSBvdmVyIGl0IHNlZW1zIHRoZSB0eXBlLTEg
aHlwZXJ2aXNvcnMKPiBhcmUgbW9yZSBpbnRlcmVzdGVkIGluIHByb3ZpZGluZyBiZXR0ZXIgaXNv
bGF0aW9uIGJldHdlZW4gc2VnbWVudHMgb2YgYQo+IHN5c3RlbSB3aGVyZWFzIFZJUlRJTyBjdXJy
ZW50bHkgYXNzdW1lcyBlaXRoZXIgdGhlIFZNTSBvciB0aGUgaHlwZXJ2aXNvcgo+IGhhcyBmdWxs
IGFjY2VzcyB0aGUgZnVsbCBndWVzdCBhZGRyZXNzIHNwYWNlLiBJJ3ZlIHNlZW4gcXVpdGUgYSBs
b3Qgb2YKPiBzbGlkZXMgdGhhdCB3YW50IHRvIGlzb2xhdGUgc2VjdGlvbnMgb2YgZGV2aWNlIGVt
dWxhdGlvbiB0byBzZXBhcmF0ZQo+IHByb2Nlc3NlcyBvciBldmVuIHNlcGFyYXRlIGd1ZXN0IFZN
cy4KCkluIFhlbiBkZXZpY2UgZW11bGF0aW9uIGlzIGRvbmUgYnkgb3RoZXIgVk1zLiBOb3JtYWxs
eSB0aGUgZGV2aWNlcyBhcmUKZW11bGF0ZWQgdmlhIGRvbTAsIGJ1dCBpdCBpcyBwb3NzaWJsZSB0
byBoYXZlIG90aGVyIGRyaXZlciBkb21haW5zLCB0b28KKHRob3NlIG5lZWQgdG8gZ2V0IHBhc3Nl
ZCB0aHJvdWdoIHRoZSByZWxhdGVkIFBDSSBkZXZpY2VzLCBvZiBjb3Vyc2UpLgoKUFYgZGV2aWNl
IGJhY2tlbmRzIGdldCBhY2Nlc3Mgb25seSB0byB0aGUgZ3Vlc3QgcGFnZXMgdGhlIFBWIGZyb250
ZW5kcwphbGxvdy4gVGhpcyBpcyBkb25lIHZpYSBzbyBjYWxsZWQgImdyYW50cyIsIHdoaWNoIGFy
ZSBwZXIgZ3Vlc3QuIFNvIGEKZnJvbnRlbmQgY2FuIGdyYW50IGFub3RoZXIgWGVuIFZNIGFjY2Vz
cyB0byBkZWRpY2F0ZWQgcGFnZXMuIFRoZSBiYWNrZW5kCmlzIHVzaW5nIHRoZSBncmFudHMgdG8g
bWFwIHRob3NlIHBhZ2VzIHZpYSB0aGUgaHlwZXJ2aXNvciBpbiBvcmRlciB0bwpwZXJmb3JtIHRo
ZSBJL08uIEFmdGVyIGZpbmlzaGluZyB0aGUgSS9PIHRoZSBJL08tcGFnZXMgYXJlIHVubWFwcGVk
IGJ5CnRoZSBiYWNrZW5kIGFnYWluLgoKRm9yIGxlZ2FjeSBkZXZpY2UgZW11bGF0aW9uIHZpYSBx
ZW11IHRoZSBndWVzdCBydW5uaW5nIHFlbXUgbmVlZHMgdG8gZ2V0CmFjY2VzcyB0byBhbGwgdGhl
IGd1ZXN0cyBtZW1vcnksIGFzIHRoZSBndWVzdCB3b24ndCBncmFudCBhbnkgcGFnZXMgdG8KdGhl
IGVtdWxhdGluZyBWTS4gSXQgaXMgcG9zc2libGUgdG8gbGV0IHFlbXUgcnVuIGluIGEgc21hbGwg
c3R1YiBndWVzdAp1c2luZyBQViBkZXZpY2VzIGluIG9yZGVyIHRvIGlzb2xhdGUgdGhlIGxlZ2Fj
eSBndWVzdCBmcm9tIGUuZy4gZG9tMC4KCgpIb3BlIHRoYXQgbWFrZXMgaXQgY2xlYXJlciwKCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
