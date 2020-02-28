Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258A17355B
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 11:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EEBEC86D2E;
	Fri, 28 Feb 2020 10:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di-d-4y6Seog; Fri, 28 Feb 2020 10:30:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74CE886CDB;
	Fri, 28 Feb 2020 10:30:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F54CC0177;
	Fri, 28 Feb 2020 10:30:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCC45C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BB48C86CDE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHVYVPkZn3hZ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:30:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4CEE086CDB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:30:45 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 01SAUdx4002005
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 11:30:39 +0100
Received: from [139.22.118.65] ([139.22.118.65])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01SAUc5h029356;
 Fri, 28 Feb 2020 11:30:38 +0100
Subject: Re: VIRTIO adoption in other hypervisors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
References: <87mu93vwy2.fsf@linaro.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
Date: Fri, 28 Feb 2020 11:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87mu93vwy2.fsf@linaro.org>
Content-Language: en-US
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <liuw@liuw.name>
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

T24gMjguMDIuMjAgMTE6MTYsIEFsZXggQmVubsOpZSB3cm90ZToKPiBIaSwKPiAKPiBJJ20gY3Vy
cmVudGx5IHRyeWluZyB0byBnZXQgbXkgaGVhZCBhcm91bmQgdmlydGlvIGFuZCB3YXMgd29uZGVy
aW5nIGhvdwo+IHdpZGVzcHJlYWQgYWRvcHRpb24gb2YgdmlydGlvIGlzIGFtb25nc3QgdGhlIHZh
cmlvdXMgaHlwZXJ2aXNvcnMgYW5kCj4gZW11bGF0b3JzIG91dCB0aGVyZS4KPiAKPiBPYnZpb3Vz
bHkgSSdtIGZhbWlsaWFyIHdpdGggUUVNVSBib3RoIHZpYSBLVk0gYW5kIGV2ZW4gd2hlbiBqdXN0
IGRvaW5nCj4gcGxhaW4gZW11bGF0aW9uIChhbHRob3VnaCB3aXRoIHNvbWUgcmVzdHJpY3Rpb25z
KS4gQXMgZmFyIGFzIEknbSBhd2FyZQo+IHRoZSB2YXJpb3VzIFJ1c3QgYmFzZWQgVk1NcyBoYXZl
IHZhcnkgZGVncmVlcyBvZiBzdXBwb3J0IGZvciB2aXJ0aW8KPiBkZXZpY2VzIG92ZXIgS1ZNIGFz
IHdlbGwuIENyb3NWTSBzcGVjaWZpY2FsbHkgaXMgZW1icmFjaW5nIHZpcnRpbyBmb3IKPiBtdWx0
aS1wcm9jZXNzIGRldmljZSBlbXVsYXRpb24uCj4gCj4gSSBiZWxpZXZlIHRoZXJlIGhhcyBiZWVu
IHNvbWUgZGV2ZWxvcG1lbnQgd29yayBmb3Igc3VwcG9ydGluZyBWSVJUSU8gb24KPiBYZW4gYWx0
aG91Z2ggaXQgc2VlbXMgdG8gaGF2ZSBzdGFsbGVkIGFjY29yZGluZyB0bzoKPiAKPiAgICBodHRw
czovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9WaXJ0aW9fT25fWGVuCj4gCj4gUmVjZW50bHkg
YXQgS1ZNIEZvcnVtIHRoZXJlIHdhcyBKYW4ncyB0YWxrIGFib3V0IEludGVyLVZNIHNoYXJlZCBt
ZW1vcnkKPiB3aGljaCBwcm9wb3NlZCBpdnNobWVtdjIgYXMgYSBWSVJUSU8gdHJhbnNwb3J0Ogo+
IAo+ICAgIGh0dHBzOi8vZXZlbnRzMTkubGludXhmb3VuZGF0aW9uLm9yZy9ldmVudHMva3ZtLWZv
cnVtLTIwMTkvcHJvZ3JhbS9zY2hlZHVsZS8KPiAKPiBBcyBJIHVuZGVyc3Rvb2QgaXQgdGhpcyB3
b3VsZCBhbGxvdyBYZW4gKGFuZCBvdGhlciBoeXBlcnZpc29ycykgYSBzaW1wbGUKPiB3YXkgdG8g
YmUgYWJsZSB0byBjYXJyeSB2aXJ0aW8gdHJhZmZpYyBiZXR3ZWVuIGd1ZXN0IGFuZCBlbmQgcG9p
bnQuCj4gCj4gU28gc29tZSBxdWVzdGlvbnM6Cj4gCj4gICAgLSBBbSBJIG1pc3NpbmcgYW55dGhp
bmcgb3V0IGluIHRoYXQgc3VtbWFyeT8KPiAgICAtIEhvdyBhYm91dCBIeXBlclYgYW5kIHRoZSBP
U1ggZXF1aXZhbGVudD8KPiAgICAtIERvIGFueSBvdGhlciB0eXBlLTEgaHlwZXJ2aXNvcnMgc3Vw
cG9ydCB2aXJ0aW8/CgogRnJvbSB0aGUgdG9wIG9mIG15IGhlYWQsIHNvbWUgb3RoZXIgaHlwZXJ2
aXNvcnMgd2l0aCB2aXJ0aW8gc3VwcG9ydCAKKGlycmVzcGVjdGl2ZSBvZiBhbnkgY2xhc3NpZmlj
YXRpb24pOgoKaHR0cHM6Ly93aWtpLmZyZWVic2Qub3JnL2JoeXZlCmh0dHBzOi8vcHJvamVjdGFj
cm4ub3JnLwpodHRwOi8vd3d3LnhoeXBlcnZpc29yLm9yZy8KaHR0cHM6Ly93d3cub3BlbnN5bmVy
Z3kuY29tL2F1dG9tb3RpdmUtaHlwZXJ2aXNvci8KCkJ1dCB0aGVyZSBhcmUgbGlrZWx5IG1vcmUu
CgpKYW4KCi0tIApTaWVtZW5zIEFHLCBDb3Jwb3JhdGUgVGVjaG5vbG9neSwgQ1QgUkRBIElPVCBT
RVMtREUKQ29ycG9yYXRlIENvbXBldGVuY2UgQ2VudGVyIEVtYmVkZGVkIExpbnV4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
