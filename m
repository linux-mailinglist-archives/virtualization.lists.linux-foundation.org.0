Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8D30EA87
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 03:58:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58B09861F1;
	Thu,  4 Feb 2021 02:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzLxQpo9EHlj; Thu,  4 Feb 2021 02:58:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C6E68610E;
	Thu,  4 Feb 2021 02:58:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23C67C013A;
	Thu,  4 Feb 2021 02:58:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F866C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 02:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 42DB9871C0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 02:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRqnquGsZe5d
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 02:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7737F8711F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 02:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612407489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=We/txEWy5TS7k8mKU0fX6vqYwMryG2RJZY1WeQ5MTGg=;
 b=iNBIHNrd5zLj1R6HNuKXcPk/4IdlqZeSIH0K7foDunpxSD/gIb6GVuBvibHsE1mpdxvQlu
 efRsVtY6a1qN/I7wd6gu2KQLxy3OnaBKF0xRttq2X5fGTf405qqx9RJhGVQSrizJ5wr+Dr
 FFUdN0z6p3O8JSZPlvGZ+i8tvzlEPhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-4I-AD5gBN-mY_QZRr-WHWQ-1; Wed, 03 Feb 2021 21:58:07 -0500
X-MC-Unique: 4I-AD5gBN-mY_QZRr-WHWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B07107ACE3;
 Thu,  4 Feb 2021 02:58:06 +0000 (UTC)
Received: from [10.72.14.1] (ovpn-14-1.pek2.redhat.com [10.72.14.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6210F5D9C0;
 Thu,  4 Feb 2021 02:57:58 +0000 (UTC)
Subject: Re: [PATCH 1/2] vdpa/mlx5: Avoid unnecessary query virtqueue
To: Si-Wei Liu <siwliu.kernel@gmail.com>
References: <20210128134130.3051-1-elic@nvidia.com>
 <20210128134130.3051-2-elic@nvidia.com>
 <CAPWQSg0XtEQ1U5N3a767Ak_naoyPdVF1CeE4r3hmN11a-aoBxg@mail.gmail.com>
 <CAPWQSg3U9DCSK_01Kzuea5B1X+Ef9JB23wBY82A3ss-UXGek_Q@mail.gmail.com>
 <9d6058d6-5ce1-0442-8fd9-5a6fe6a0bc6b@redhat.com>
 <CAPWQSg3KOAypcrs9krW8cGE7EDLTehCUCYFZMUYYNaYPH1oBZQ@mail.gmail.com>
 <c65808bf-b336-8718-f7ea-b39fcc658dfb@redhat.com>
 <20210202070631.GA233234@mtl-vdi-166.wap.labs.mlnx>
 <CAPWQSg058RGaxSS7s5s=kpxdGryiy2padRFztUZtXN+ttiDd1A@mail.gmail.com>
 <20210202092253.GA236663@mtl-vdi-166.wap.labs.mlnx>
 <CAPWQSg0tRXoGF88LQSLzUg88ZEi8p+M=R6Qd445iABShfn-o4g@mail.gmail.com>
 <eed86e79-4fd9-dfcf-da17-288a3fc597e3@redhat.com>
 <CAPWQSg1=aXByZoR2eZj4rfak0CDxZF6GnLNsh-vMyqyERetQpw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2a65c6c1-cf88-90ca-beb9-8ac55a2c7fe7@redhat.com>
Date: Thu, 4 Feb 2021 10:57:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPWQSg1=aXByZoR2eZj4rfak0CDxZF6GnLNsh-vMyqyERetQpw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: lulu@redhat.com, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <elic@nvidia.com>
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

Ck9uIDIwMjEvMi80IOS4iuWNiDc6MTksIFNpLVdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MiwgMjAyMSBhdCA5OjE2IFBNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAyMDIxLzIvMyDkuIrljYgxOjU0LCBTaS1XZWkgTGl1IHdyb3RlOgo+Pj4gT24g
VHVlLCBGZWIgMiwgMjAyMSBhdCAxOjIzIEFNIEVsaSBDb2hlbiA8ZWxpY0BudmlkaWEuY29tPiB3
cm90ZToKPj4+PiBPbiBUdWUsIEZlYiAwMiwgMjAyMSBhdCAxMjozODo1MUFNIC0wODAwLCBTaS1X
ZWkgTGl1IHdyb3RlOgo+Pj4+PiBUaGFua3MgRWxpIGFuZCBKYXNvbiBmb3IgY2xhcmlmaWNhdGlv
bnMuIFNlZSBpbmxpbmUuCj4+Pj4+Cj4+Pj4+IE9uIE1vbiwgRmViIDEsIDIwMjEgYXQgMTE6MDYg
UE0gRWxpIENvaGVuIDxlbGljQG52aWRpYS5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gVHVlLCBGZWIg
MDIsIDIwMjEgYXQgMDI6MDI6MjVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+PiBP
biAyMDIxLzIvMiDkuIvljYgxMjoxNSwgU2ktV2VpIExpdSB3cm90ZToKPj4+Pj4+Pj4gT24gTW9u
LCBGZWIgMSwgMjAyMSBhdCA3OjEzIFBNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
IHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMjAyMS8yLzIg5LiK5Y2IMzoxNywgU2ktV2VpIExpdSB3cm90
ZToKPj4+Pj4+Pj4+PiBPbiBNb24sIEZlYiAxLCAyMDIxIGF0IDEwOjUxIEFNIFNpLVdlaSBMaXUg
PHNpd2xpdS5rZXJuZWxAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24gVGh1LCBKYW4g
MjgsIDIwMjEgYXQgNTo0NiBBTSBFbGkgQ29oZW4gPGVsaWNAbnZpZGlhLmNvbT4gd3JvdGU6Cj4+
Pj4+Pj4+Pj4+PiBzdXNwZW5kX3ZxIHNob3VsZCBvbmx5IHN1c3BlbmQgdGhlIFZRIG9uIG5vdCBz
YXZlIHRoZSBjdXJyZW50IGF2YWlsYWJsZQo+Pj4+Pj4+Pj4+Pj4gaW5kZXguIFRoaXMgaXMgZG9u
ZSB3aGVuIGEgY2hhbmdlIG9mIG1hcCBvY2N1cnMgd2hlbiB0aGUgZHJpdmVyIGNhbGxzCj4+Pj4+
Pj4+Pj4+PiBzYXZlX2NoYW5uZWxfaW5mbygpLgo+Pj4+Pj4+Pj4+PiBIbW1tLCBzdXNwZW5kX3Zx
KCkgaXMgYWxzbyBjYWxsZWQgYnkgdGVhcmRvd25fdnEoKSwgdGhlIGxhdHRlciBvZgo+Pj4+Pj4+
Pj4+PiB3aGljaCBkb2Vzbid0IHNhdmUgdGhlIGF2YWlsYWJsZSBpbmRleCBhcyBzYXZlX2NoYW5u
ZWxfaW5mbygpIGRvZXNuJ3QKPj4+Pj4+Pj4+Pj4gZ2V0IGNhbGxlZCBpbiB0aGF0IHBhdGggYXQg
YWxsLiBIb3cgZG9lcyBpdCBoYW5kbGUgdGhlIGNhc2UgdGhhdAo+Pj4+Pj4+Pj4+PiBhZ2V0X3Zx
X3N0YXRlKCkgaXMgY2FsbGVkIGZyb20gdXNlcnNwYWNlIChlLmcuIFFFTVUpIHdoaWxlIHRoZQo+
Pj4+Pj4+Pj4+PiBoYXJkd2FyZSBWUSBvYmplY3Qgd2FzIHRvcm4gZG93biwgYnV0IHVzZXJzcGFj
ZSBzdGlsbCB3YW50cyB0byBhY2Nlc3MKPj4+Pj4+Pj4+Pj4gdGhlIHF1ZXVlIGluZGV4Pwo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBSZWZlciB0byBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRk
ZXYvMTYwMTU4MzUxMS0xNTEzOC0xLWdpdC1zZW5kLWVtYWlsLXNpLXdlaS5saXVAb3JhY2xlLmNv
bS8KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gdmhvc3QgVlEgMCByaW5nIHJlc3RvcmUgZmFpbGVk
OiAtMTogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUgKDExKQo+Pj4+Pj4+Pj4+PiB2
aG9zdCBWUSAxIHJpbmcgcmVzdG9yZSBmYWlsZWQ6IC0xOiBSZXNvdXJjZSB0ZW1wb3JhcmlseSB1
bmF2YWlsYWJsZSAoMTEpCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFFFTVUgd2lsbCBjb21wbGFp
biB3aXRoIHRoZSBhYm92ZSB3YXJuaW5nIHdoaWxlIFZNIGlzIGJlaW5nIHJlYm9vdGVkCj4+Pj4+
Pj4+Pj4+IG9yIHNodXQgZG93bi4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gTG9va3MgdG8gbWUg
ZWl0aGVyIHRoZSBrZXJuZWwgZHJpdmVyIHNob3VsZCBjb3ZlciB0aGlzIHJlcXVpcmVtZW50LCBv
cgo+Pj4+Pj4+Pj4+PiB0aGUgdXNlcnNwYWNlIGhhcyB0byBiZWFyIHRoZSBidXJkZW4gaW4gc2F2
aW5nIHRoZSBpbmRleCBhbmQgbm90IGNhbGwKPj4+Pj4+Pj4+Pj4gaW50byBrZXJuZWwgaWYgVlEg
aXMgZGVzdHJveWVkLgo+Pj4+Pj4+Pj4+IEFjdHVhbGx5LCB0aGUgdXNlcnNwYWNlIGRvZXNuJ3Qg
aGF2ZSB0aGUgaW5zaWdodHMgd2hldGhlciB2aXJ0IHF1ZXVlCj4+Pj4+Pj4+Pj4gd2lsbCBiZSBk
ZXN0cm95ZWQgaWYganVzdCBjaGFuZ2luZyB0aGUgZGV2aWNlIHN0YXR1cyB2aWEgc2V0X3N0YXR1
cygpLgo+Pj4+Pj4+Pj4+IExvb2tpbmcgYXQgb3RoZXIgdmRwYSBkcml2ZXIgaW4gdHJlZSBpLmUu
IGlmY3ZmIGl0IGRvZXNuJ3QgYmVoYXZlIGxpa2UKPj4+Pj4+Pj4+PiBzby4gSGVuY2UgdGhpcyBz
dGlsbCBsb29rcyB0byBtZSB0byBiZSBNZWxsYW5veCBzcGVjaWZpY3MgYW5kCj4+Pj4+Pj4+Pj4g
bWx4NV92ZHBhIGltcGxlbWVudGF0aW9uIGRldGFpbCB0aGF0IHNob3VsZG4ndCBleHBvc2UgdG8g
dXNlcnNwYWNlLgo+Pj4+Pj4+Pj4gU28gSSB0aGluayB3ZSBjYW4gc2ltcGx5IGRyb3AgdGhpcyBw
YXRjaD8KPj4+Pj4+Pj4gWWVwLCBJIHRoaW5rIHNvLiBUbyBiZSBob25lc3QgSSBkb24ndCBrbm93
IHdoeSBpdCBoYXMgYW55dGhpbmcgdG8gZG8KPj4+Pj4+Pj4gd2l0aCB0aGUgbWVtb3J5IGhvdHBs
dWcgaXNzdWUuCj4+Pj4+Pj4gRWxpIG1heSBrbm93IG1vcmUsIG15IHVuZGVyc3RhbmRpbmcgaXMg
dGhhdCwgZHVyaW5nIG1lbW9yeSBob3RwbHV0LCBxZW11Cj4+Pj4+Pj4gbmVlZCB0byBwcm9wYWdh
dGUgbmV3IG1lbW9yeSBtYXBwaW5ncyB2aWEgc2V0X21hcCgpLiBGb3IgbWVsbGFub3gsIGl0IG1l
YW5zCj4+Pj4+Pj4gaXQgbmVlZHMgdG8gcmVidWlsZCBtZW1vcnkga2V5cywgc28gdGhlIHZpcnRx
dWV1ZSBuZWVkcyB0byBiZSBzdXNwZW5kZWQuCj4+Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgU2l3ZWkg
d2FzIGFza2luZyB3aHkgdGhlIGZpcnN0IHBhdGNoIHdhcyByZWxhdGVkIHRvIHRoZSBob3RwbHVn
Cj4+Pj4+PiBpc3N1ZS4KPj4+Pj4gSSB3YXMgdGhpbmtpbmcgaG93IGNvbnNpc3RlbmN5IGlzIGFz
c3VyZWQgd2hlbiBzYXZpbmcvcmVzdG9yaW5nIHRoaXMKPj4+Pj4gaC93IGF2YWlsX2luZGV4IGFn
YWluc3QgdGhlIG9uZSBpbiB0aGUgdmlydHEgbWVtb3J5LCBwYXJ0aWN1bGFybHkgaW4KPj4+Pj4g
dGhlIHJlZ2lvbl9hZGQvLnJlZ2lvbl9kZWwoKSBjb250ZXh0IChlLmcuIHRoZSBob3RwbHVnIGNh
c2UpLiBQcm9ibGVtCj4+Pj4+IGlzIEkgZG9uJ3Qgc2VlIGV4cGxpY2l0IG1lbW9yeSBiYXJyaWVy
IHdoZW4gZ3Vlc3QgdGhyZWFkIHVwZGF0ZXMgdGhlCj4+Pj4+IGF2YWlsX2luZGV4LCBob3cgZG9l
cyB0aGUgZGV2aWNlIG1ha2Ugc3VyZSB0aGUgaC93IGF2YWlsX2luZGV4IGlzCj4+Pj4+IHVwdG9k
YXRlIHdoaWxlIGd1ZXN0IG1heSByYWNlIHdpdGggdXBkYXRpbmcgdGhlIHZpcnRxJ3MgYXZhaWxf
aW5kZXggaW4KPj4+Pj4gdGhlIG1lYW4gd2hpbGU/IE1heWJlIEkgY29tcGxldGVseSBtaXNzIHNv
bWV0aGluZyBvYnZpb3VzPwo+Pj4+IERLSU0tU2lnbmF0dXJlOiB2MTsgYXJzYS1zaGEyNTY7IGNy
ZWxheGVkL3JlbGF4ZWQ7IGRudmlkaWEuY29tOyBzbjE7Cj4+Pj4gICAgICAgICAgIHQgMTIyNTc3
ODA7IGJoSG5CMHo0VkVLd1JTM1dHWThkODM2TUpneHU1RWxuL2piRlpsTlhWeGMwODsKPj4+PiAg
ICAgICAgICAgaFgtUEdQLVVuaXZlcnNhbDpEYXRlOkZyb206VG86Q0M6U3ViamVjdDpNZXNzYWdl
LUlEOlJlZmVyZW5jZXM6Cj4+Pj4gICAgICAgICAgICBNSU1FLVZlcnNpb246Q29udGVudC1UeXBl
OkNvbnRlbnQtRGlzcG9zaXRpb246Cj4+Pj4gICAgICAgICAgICBDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOkluLVJlcGx5LVRvOlVzZXItQWdlbnQ6WC1PcmlnaW5hdGluZy1JUDoKPj4+PiAgICAg
ICAgICAgIFgtQ2xpZW50UHJveGllZEJ5Owo+Pj4+ICAgICAgICAgICBiZ0dtYjgrcmNuMy9yS3pL
US83UXpTbmdoV3paK0ZBVTBYbnRzUlpZR1E2NnNGdlQ3enNZUEhvZ0czTElXTlk3N3QKPj4+PiAg
ICAgICAgICAgIHdOSFB3N0dDSnJOYUgzbkVYUGJPcDBGTU9adzRLdjRXN1VQdVlQb2JiTGVUa3Z1
UEFpZGpCOGRNNDJ2eisxWDYxdAo+Pj4+ICAgICAgICAgICAgOUlWUVQ5WDRobkF4UmpJNUNxWk9v
NDFHUzRUbDFYK3lrR29BK1ZFODBCUi9SLytuUTN0WERWVUxmcHB6ZUIrdnUzCj4+Pj4gICAgICAg
ICAgICBUV25ucGFaMkd5b055UGxNaXlWUmtIZFh6RFZnQTR1UUh4d0huN290R0s1SjRsenl1OEty
RnlRdGlQK2Y2aGZ1NXYKPj4+PiAgICAgICAgICAgIGNySmtZUzhlOUErcmZ6VW1LV3V5SGNLY21o
UGhBVko0WGRwelpjRFhYbE1IVnhHN25SMW84OHh0dEM2RDErb05JUAo+Pj4+ICAgICAgICAgICAg
OXhISTNEa05CcEV1QQo+Pj4+IElmIHlvdSdyZSBhc2tpbmcgYWJvdXQgc3luY3Jvbml6YXRpb24g
dXBvbiBob3QgcGx1ZyBvZiBtZW1vcnksIHRoZQo+Pj4+IGhhcmR3YXJlIGFsd2F5cyBnb2VzIHRv
IHJlYWQgdGhlIGF2YWlsYWJsZSBpbmRleCBmcm9tIG1lbW9yeSB3aGVuIGEgbmV3Cj4+Pj4gaGFy
ZHdhcmUgb2JqZWN0IGlzIGFzc29jaXRlZCB3aXRoIGEgdmlydHF1ZXVlLiBZb3UgY2FuIGFyZ3Vl
IHRoZW4gdGhhdAo+Pj4+IHlvdSBkb24ndCBuZWVkIHRvIHJlc3RvcmUgdGhlIGF2YWlsYWJsZSBp
bmRleCBhbmQgeW91IG1heSBiZSByaWdodCBidXQKPj4+PiB0aGlzIGlzIHRoZSBjdXJyZWN0IGlu
dGVmYWNlIHRvIHRoZSBmaXJtd2FyZS4KPj4+Pgo+Pj4+Cj4+Pj4gSWYgeW91J3JlIGFza2luZyBv
biBnZW5lcmFsbHkgaG93IHN5bmMgaXMgYXNzdXJlZCB3aGVuIHRoZSBndWVzdCB1cGRhdGVzCj4+
Pj4gdGhlIGF2YWlsYWJsZSBpbmRleCwgY2FuIHlvdSBwbGVhc2Ugc2VuZCBhIHBvaW50ZXIgdG8g
dGhlIGNvZGUgd2hlcmUgeW91Cj4+Pj4gc2VlIHRoZSB1cGRhdGUgd2l0aG91dCBhIG1lbW9yeSBi
YXJyaWVyPwo+Pj4gVGhpcyBpcyBhIHNuaXBwZXQgb2YgdmlydHF1ZXVlX2FkZF9zcGxpdCgpIHdo
ZXJlIGF2YWlsX2luZGV4IGdldHMKPj4+IHVwZGF0ZWQgYnkgZ3Vlc3Q6Cj4+Pgo+Pj4gICAgICAg
ICAgIC8qIFB1dCBlbnRyeSBpbiBhdmFpbGFibGUgYXJyYXkgKGJ1dCBkb24ndCB1cGRhdGUgYXZh
aWwtPmlkeCB1bnRpbCB0aGV5Cj4+PiAgICAgICAgICAgICogZG8gc3luYykuICovCj4+PiAgICAg
ICAgICAgYXZhaWwgPSB2cS0+c3BsaXQuYXZhaWxfaWR4X3NoYWRvdyAmICh2cS0+c3BsaXQudnJp
bmcubnVtIC0gMSk7Cj4+PiAgICAgICAgICAgdnEtPnNwbGl0LnZyaW5nLmF2YWlsLT5yaW5nW2F2
YWlsXSA9IGNwdV90b192aXJ0aW8xNihfdnEtPnZkZXYsIGhlYWQpOwo+Pj4KPj4+ICAgICAgICAg
ICAvKiBEZXNjcmlwdG9ycyBhbmQgYXZhaWxhYmxlIGFycmF5IG5lZWQgdG8gYmUgc2V0IGJlZm9y
ZSB3ZSBleHBvc2UgdGhlCj4+PiAgICAgICAgICAgICogbmV3IGF2YWlsYWJsZSBhcnJheSBlbnRy
aWVzLiAqLwo+Pj4gICAgICAgICAgIHZpcnRpb193bWIodnEtPndlYWtfYmFycmllcnMpOwo+Pj4g
ICAgICAgICAgIHZxLT5zcGxpdC5hdmFpbF9pZHhfc2hhZG93Kys7Cj4+PiAgICAgICAgICAgdnEt
PnNwbGl0LnZyaW5nLmF2YWlsLT5pZHggPSBjcHVfdG9fdmlydGlvMTYoX3ZxLT52ZGV2LAo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cS0+c3Bs
aXQuYXZhaWxfaWR4X3NoYWRvdyk7Cj4+PiAgICAgICAgICAgdnEtPm51bV9hZGRlZCsrOwo+Pj4K
Pj4+IFRoZXJlJ3MgbWVtb3J5IGJhcnJpZXIgdG8gbWFrZSBzdXJlIHRoZSB1cGRhdGUgdG8gZGVz
Y3JpcHRvciBhbmQKPj4+IGF2YWlsYWJsZSByaW5nIGlzIHNlZW4gYmVmb3JlIHdyaXRpbmcgdG8g
dGhlIGF2YWlsLT5pZHgsIGJ1dCB0aGVyZQo+Pj4gc2VlbXMgbm8gZ3VyYW50ZWUgdGhhdCB0aGlz
IHVwZGF0ZSB3b3VsZCBmbHVzaCB0byB0aGUgbWVtb3J5Cj4+PiBpbW1tZWRhdGVseSBlaXRoZXIg
YmVmb3JlIG9yIGFmdGVyIHRoZSBtbHg1LXZkcGEgaXMgc3VzcGVuZWQgYW5kIGdldHMKPj4+IHRo
ZSBvbGQgYXZhaWxfaW5kZXggdmFsdWUgc3Rhc2hlZCBzb21ld2hlcmUuIEluIHRoaXMgY2FzZSwg
aG93IGRvZXMKPj4+IHRoZSBoYXJkd2FyZSBlbnN1cmUgdGhlIGNvbnNpc3RlbmN5IGJldHdlZW4g
dGhlIGd1ZXN0IHZpcnRpbyBhbmQgaG9zdAo+Pj4gbWx4NS12ZHBhPyBPciwgaXQgY29tcGxldGx5
IHJlbGllcyBvbiBndWVzdCB0byB1cGRhdGUgdGhlIGF2YWlsX2luZGV4Cj4+PiBvbmNlIHRoZSBu
ZXh0IGJ1ZmZlciBpcyBhdmFpbGFibGUsIHNvIHRoYXQgdGhlIGluZGV4IHdpbGwgYmUgaW4gc3lu
Ywo+Pj4gYWdhaW4/Cj4+Cj4+IEknbSBub3Qgc3VyZSBJIGdldCB0aGUgcXVlc3Rpb24gYnV0IG5v
dGljZSB0aGF0IHRoZSBkcml2ZXIgc2hvdWxkIGNoZWNrCj4+IGFuZCBub3RpZnkgdmlydHF1ZXVl
IHdoZW4gZGV2aWNlIHdhbnQgYSBub3RpZmljYXRpb24uIFNvIHRoZXJlJ3MgYQo+PiB2aXJ0aW9f
d21iKCkgZS5nIGluOgo+Pgo+PiBzdGF0aWMgYm9vbCB2aXJ0cXVldWVfa2lja19wcmVwYXJlX3Nw
bGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPj4gewo+PiAgICAgICBzdHJ1Y3QgdnJpbmdfdmly
dHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+PiAgICAgICB1MTYgbmV3LCBvbGQ7Cj4+ICAgICAg
IGJvb2wgbmVlZHNfa2ljazsKPj4KPj4gICAgICAgU1RBUlRfVVNFKHZxKTsKPj4gICAgICAgLyog
V2UgbmVlZCB0byBleHBvc2UgYXZhaWxhYmxlIGFycmF5IGVudHJpZXMgYmVmb3JlIGNoZWNraW5n
IGF2YWlsCj4+ICAgICAgICAqIGV2ZW50LiAqLwo+PiAgICAgICB2aXJ0aW9fbWIodnEtPndlYWtf
YmFycmllcyk7Cj4+Cj4+ICAgICAgIG9sZCA9IHZxLT5zcGxpdC5hdmFpbF9pZHhfc2hhZG93IC0g
dnEtPm51bV9hZGRlZDsKPj4gICAgICAgbmV3ID0gdnEtPnNwbGl0LmF2YWlsX2lkeF9zaGFkb3c7
Cj4+ICAgICAgIHZxLT5udW1fYWRkZWQgPSAwOwo+Pgo+PiAoU2VlIHRoZSBjb21tZW50IGFib3Zl
IHZpcnRpb19tYigpKS4gU28gdGhlIGF2YWlsIGlkeCBpcyBndWFyYW50ZWVkIHRvCj4+IGJlIGNv
bW1pdHRlZCB0byBtZW1yb3koY2FjaGUgaGllcmFyY2h5KSBiZWZvcmUgdGhlIGNoZWNrIG9mCj4+
IG5vdGlmaWNhdGlvbi4gSSB0aGluayB3ZSBzeW5jIHRocm91Z2ggdGhpcy4KPiBUaGFua3MgZm9y
IHBvaW50aW5nIGl0IG91dCEgSW5kZWVkLCB0aGUgYXZhaWwgaW5kZXggaXMgc3luY2VkIGJlZm9y
ZQo+IGtpY2tpbmcgdGhlIGRldmljZS4gSG93ZXZlciwgZXZlbiBzbyBJIHRoaW5rIHRoZSByYWNl
IG1pZ2h0IHN0aWxsIGJlCj4gcG9zc2libGUsIHNlZSBiZWxvdzoKPgo+Cj4gICAgbWx4NV92ZHBh
IGRldmljZSAgICAgICAgICAgICAgICAgICAgICAgdmlydGlvIGRyaXZlcgo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRxdWV1ZV9hZGRf
c3BsaXQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGJ1bXBlZCB1cCBh
dmFpbF9pZHgxIHRvCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF2YWls
X2lkeDIsIGJ1dCB1cGRhdGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bm90IHlldCBjb21taXR0ZWQgdG8gbWVtKQo+Cj4gKGhvdCBwbHVnIG1lbW9yeS4uLikKPiBtbHg1
X3ZkcGFfc2V0X21hcAo+ICAgIG1seDVfdmRwYV9jaGFuZ2VfbWFwCj4gICAgICBzdXNwZW5kX3Zx
cwo+ICAgICAgICBzdXNwZW5kX3ZxCj4gICAgICAgICAgKGF2YWlsX2lkeDEgd2FzIHNhdmVkKQo+
ICAgICAgc2F2ZV9jaGFubmVsc19pbmZvCj4gICAgICA6Cj4gICAgICA6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2aXJ0cXVldWVfa2lja19wcmVwYXJlX3NwbGl0Cj4gICAgICA6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChhdmFpbF9pZHgyIGNvbW1pdHRlZCB0byBtZW1vcnkp
Cj4gICAgICByZXN0b3JlX2NoYW5uZWxzX2luZm8KPiAgICAgIHNldHVwX2RyaXZlcgo+ICAgICAg
ICAuLi4KPiAgICAgICAgICBjcmVhdGVfdmlydHF1ZXVlCj4gICAgICAgICAgICAoc2F2ZWQgYXZh
aWxfaWR4MQo+ICAgICAgICAgICAgZ2V0dGluZyByZXN0b3JlZDsKPiAgICAgICAgICAgIHdoZXJl
YXMgY3VycmVudAo+ICAgICAgICAgICAgYXZhaWxfaWR4MiBpbgo+ICAgICAgICAgICAgbWVtb3J5
IGlzIGlnbm9yZWQpCgoKVGhlIGluZGV4IGlzIG5vdCBpZ25vcmVkLCB0aGUgZGV2aWNlIGlzIGV4
cGVjdGVkIHRvIHJlYWQgZGVzY3JpcHRvcnMgCmZyb20gYXZhaWxfaWR4MSB1bnRpbCBhdmFpbF9p
ZHgyLgoKCj4gOgo+IDoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aXJ0
cXVldWVfbm90aWZ5Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cF9u
b3RpZnkKPiBtbHg1X3ZkcGFfa2lja192cQo+ICAgIChkZXZpY2UgcHJvY2Vzc2luZyB1cCB0bwo+
ICAgIGF2YWlsX2lkeDEgcmF0aGVyIHRoYW4KPiAgICBhdmFpbF9pZHgyPykKPgo+Cj4gQWNjb3Jk
aW5nIHRvIEVsaSwgdGhlIHZkcGEgZmlybXdhcmUgZG9lcyBub3QgbG9hZCB0aGUgbGF0ZXN0IHZh
bHVlLAo+IGkuZS4gYXZhaWxfaWR4MiBmcm9tIG1lbW9yeSB3aGVuIHJlLWNyZWF0aW5nIHRoZSB2
aXJ0cXVldWUgb2JqZWN0LgoKCkR1cmluZyBzeW5jIGl0J3Mgbm90IG5lZWRlZCBidXQgYWZ0ZXIg
dGhlIGRldmljZSBzdGFydCB0byB3b3JrLCBpdCBuZWVkcyAKdG8gcmVhZCBkZXNjcmlwdG9yIHVu
dGlsIHRoZSBhdmFpbGFibGUgaW5kZXguCgoKPiBJbnN0ZWFkIGl0IHN0YXJ0cyB3aXRoIGEgc3Rh
bGUgYXZhaWxfaWR4MSB0aGF0IHdhcyBzYXZlZCBpbiBtbHg1X3ZkcGEKPiBkcml2ZXIgcHJpdmF0
ZSBzdHJ1Y3R1cmUgYmVmb3JlIHRoZSBtZW1vcnkgdXBkYXRlIGlzIG1hZGUuIFRoYXQgaXMgdGhl
Cj4gd2F5IGhvdyB0aGUgY3VycmVudCBmaXJtd2FyZSBpbnRlcmZhY2UgaXMgZGVzaWduZWQuIFRo
ZSB0aGluZyBJJ20gbm90Cj4gc3VyZSB0aG91Z2ggaXMgaWYgdGhlIGZpcm13YXJlL2RldmljZSB3
aWxsIHJlc3luYyBhbmQgZ2V0IHRvIHRoZQo+IGxhdGVzdCBhdmFpbF9pZHgyIGZyb20gbWVtb3J5
IHdoaWxlIHByb2Nlc3NpbmcgdGhlIGtpY2sgcmVxdWVzdCB3aXRoCj4gbWx4NV92ZHBhX2tpY2tf
dnE/CgoKSSB0aGluayB0aGUgcG9pbnQgaXMgdGhhdCwgdGhlIGRldmljZSBtdXN0IGhhdmUgYW4g
aW50ZXJuYWwgYXZhaWwgaW5kZXgsIAphbmQgdGhlIGRldmljZSBpcyBvbmx5IGV4cGVjdGVkIHRv
IHN5bmMgdGhpcyBpbnRlcm5hbCBhdmFpbCBpbmRleC4KCgo+IElmIG5vdCwgYSBmZXcgYXZhaWwg
ZW50cmllcyB3aWxsIGJlIG1pc3NpbmcgaW4gdGhlCj4ga2ljaywgd2hpY2ggY291bGQgY2F1c2Ug
b2RkIGJlaGF2aW9yIG9yIGltcGxpY2l0IGZhaWx1cmUuCj4KPiBCdXQgaWYgdGhlIGZpcm13YXJl
IHdpbGwgcmVzeW5jIG9uIGtpY2tfdnEgKGFuZCBnZXRfdnFfc3RhdGUpLCBJIHRoaW5rCj4gSSBj
b21wbGV0ZWx5IGxvc3QgdGhlIHBvaW50IG9mIHNhdmluZyBhbmQgcmVzdG9yaW5nIGF2YWlsX2lk
eCB3aGVuCj4gY2hhbmdpbmcgdGhlIG1lbW9yeSBtYXAuLi4KCgpUaGUgbWVtb3J5IG1hcCBjaGFu
Z2luZyBpcyB1c3VhbGx5IHRyYW5zcGFyZW50IHRvIGd1ZXN0IGRyaXZlciBidXQgb25seSAKdGhl
IGRldmljZS4gTWF5YmUgeW91IGNhbiByZWZlciB2aG9zdCBjb2RlcyBvciBxZW11IGNvZGVzIGZv
ciB0aGUgZGV2aWNlIApsb2dpYy4KClRoYW5rcwoKCj4KPiBUaGFua3MsCj4gLVNpd2VpCj4KPj4g
VGhhbmtzCj4+Cj4+Cj4+PiBUaGFua3MsCj4+PiAtU2l3ZWkKPj4+Cj4+Pj4+IFRoYW5rcywKPj4+
Pj4gLVNpd2VpCj4+Pj4+Cj4+Pj4+PiBCdXQgeW91J3JlIGNvcnJlY3QuIFdoZW4gbWVtb3J5IGlz
IGFkZGVkLCBJIGdldCBhIG5ldyBtZW1vcnkgbWFwLiBUaGlzCj4+Pj4+PiByZXF1aXJlcyBtZSB0
byBidWlsZCBhIG5ldyBtZW1vcnkga2V5IG9iamVjdCB3aGljaCBjb3ZlcnMgdGhlIG5ldyBtZW1v
cnkKPj4+Pj4+IG1hcC4gU2luY2UgdGhlIHZpcnRxdWV1ZSBvYmplY3RzIGFyZSByZWZlcmVuY2lu
ZyB0aGlzIG1lbW9yeSBrZXksIEkgbmVlZAo+Pj4+Pj4gdG8gZGVzdHJveSB0aGVtIGFuZCBidWls
ZCBuZXcgb25lcyByZWZlcm5jaW5nIHRoZSBuZXcgbWVtb3J5IGtleS4KPj4+Pj4+Cj4+Pj4+Pj4g
VGhhbmtzCj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+PiAtU2l3ZWkKPj4+Pj4+Pj4KPj4+Pj4+Pj4+
IFRoYW5rcwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IC1TaXdlaQo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRWxpIENvaGVuIDxlbGlj
QG52aWRpYS5jb20+Cj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+ICAgICAgZHJpdmVycy92
ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIHwgOCAtLS0tLS0tLQo+Pj4+Pj4+Pj4+Pj4gICAgICAx
IGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIGIvZHJpdmVycy92
ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4+Pj4+Pj4+Pj4+PiBpbmRleCA4OGRkZTM0NTViZmQu
LjU0OWRlZDA3NGZmMyAxMDA2NDQKPj4+Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1
L25ldC9tbHg1X3ZuZXQuYwo+Pj4+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy92ZHBhL21seDUvbmV0
L21seDVfdm5ldC5jCj4+Pj4+Pj4+Pj4+PiBAQCAtMTE0OCw4ICsxMTQ4LDYgQEAgc3RhdGljIGlu
dCBzZXR1cF92cShzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRldiwgc3RydWN0IG1seDVfdmRwYV92
aXJ0cXVldWUgKm12cSkKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiAgICAgIHN0YXRpYyB2b2lk
IHN1c3BlbmRfdnEoc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYsIHN0cnVjdCBtbHg1X3ZkcGFf
dmlydHF1ZXVlICptdnEpCj4+Pj4+Pj4+Pj4+PiAgICAgIHsKPj4+Pj4+Pj4+Pj4+IC0gICAgICAg
c3RydWN0IG1seDVfdmlydHFfYXR0ciBhdHRyOwo+Pj4+Pj4+Pj4+Pj4gLQo+Pj4+Pj4+Pj4+Pj4g
ICAgICAgICAgICAgaWYgKCFtdnEtPmluaXRpYWxpemVkKQo+Pj4+Pj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gQEAgLTExNTgsMTIg
KzExNTYsNiBAQCBzdGF0aWMgdm9pZCBzdXNwZW5kX3ZxKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpu
ZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX3ZpcnRxdWV1ZSAqbQo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4+ICAgICAgICAgICAgIGlmIChtb2RpZnlfdmlydHF1ZXVlKG5kZXYsIG12cSwgTUxYNV9WSVJU
SU9fTkVUX1FfT0JKRUNUX1NUQVRFX1NVU1BFTkQpKQo+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAg
ICAgICAgICBtbHg1X3ZkcGFfd2FybigmbmRldi0+bXZkZXYsICJtb2RpZnkgdG8gc3VzcGVuZCBm
YWlsZWRcbiIpOwo+Pj4+Pj4+Pj4+Pj4gLQo+Pj4+Pj4+Pj4+Pj4gLSAgICAgICBpZiAocXVlcnlf
dmlydHF1ZXVlKG5kZXYsIG12cSwgJmF0dHIpKSB7Cj4+Pj4+Pj4+Pj4+PiAtICAgICAgICAgICAg
ICAgbWx4NV92ZHBhX3dhcm4oJm5kZXYtPm12ZGV2LCAiZmFpbGVkIHRvIHF1ZXJ5IHZpcnRxdWV1
ZVxuIik7Cj4+Pj4+Pj4+Pj4+PiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4+Pj4+Pj4+Pj4g
LSAgICAgICB9Cj4+Pj4+Pj4+Pj4+PiAtICAgICAgIG12cS0+YXZhaWxfaWR4ID0gYXR0ci5hdmFp
bGFibGVfaW5kZXg7Cj4+Pj4+Pj4+Pj4+PiAgICAgIH0KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
PiAgICAgIHN0YXRpYyB2b2lkIHN1c3BlbmRfdnFzKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2
KQo+Pj4+Pj4+Pj4+Pj4gLS0KPj4+Pj4+Pj4+Pj4+IDIuMjkuMgo+Pj4+Pj4+Pj4+Pj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
