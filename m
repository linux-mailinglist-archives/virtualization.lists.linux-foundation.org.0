Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B2476859
	for <lists.virtualization@lfdr.de>; Thu, 16 Dec 2021 03:53:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309B4830DE;
	Thu, 16 Dec 2021 02:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id taKJU_58-TBl; Thu, 16 Dec 2021 02:53:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8B869831DB;
	Thu, 16 Dec 2021 02:53:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F028BC0070;
	Thu, 16 Dec 2021 02:53:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B4FEC0012
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 02:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5355683104
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 02:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pD0_ByLvfvmk
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 02:53:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C98830DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 02:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639623212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCc5Lvmtn3H7qqXmc5mlvmPAoLf54qIbgbfcsPg1q3E=;
 b=W0CEs0vrniQz03mQSwtd2HWAr4zGf7C7x1UWA987lSLwZrcV1PquncIbeksI+cy70TOBoE
 ifs8yAjPbTE8F1R0weVip074k+drY2l73X0G5bkCk7PZFIkTxTKP83Siy0U01JIgROxFBP
 E/wvIFLfShfz+uMwaJSIvcgrq9z2oEs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-adlm5mipOY2yg0eszDtLAw-1; Wed, 15 Dec 2021 21:53:26 -0500
X-MC-Unique: adlm5mipOY2yg0eszDtLAw-1
Received: by mail-lj1-f198.google.com with SMTP id
 r20-20020a2eb894000000b0021a4e932846so7927433ljp.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 18:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CCc5Lvmtn3H7qqXmc5mlvmPAoLf54qIbgbfcsPg1q3E=;
 b=kKVAUzZnGcIeeDKBlaBfjM68T4ZiJosnf6xvv2sxrE0tu+ZvvdNKvrWh4lDv4dx2jb
 gFXcLf7HNG7UlY8XwBHi6TtCmUbx1lAwkEUUnbRp687uogqO8LPay3WVRclTfJWtX12z
 de60bJtFknHaaDjae+qmV7FYJIuGCTuhjkdr0tcW2V8rymvN3mmPJbqMRX78A0dVBuFa
 zLkeGXiWWkmgYfDFIDE2gskCm/HxvJ7xYqBPCjDCHcrUWvrOg0M4vJuYV4dYVMyp+OG+
 vVDwtOvroF8il+X3pI8g7PELF7Klbw8eh0WOK18wrgRL4wlZStad8NB3nP+gxH5s1vgS
 MSRQ==
X-Gm-Message-State: AOAM533vyMSFXCvqaIAfrNeTijy2gxx0MTnu6JjM+Y1853HD3JHwqoji
 NE01iRansWdoHLT3kZ9SrLv4kBJVLk1UweTWFHu2uTy/YWiB7YUL2mhS9/qNmiAsZxbOxc39YWS
 YRJNYm1aSzluXZ9Cgi5cUYeWy0KnzDfgTblLo1YmnQiz/b+YT6lXgCK86iQ==
X-Received: by 2002:a05:6512:3987:: with SMTP id
 j7mr12474562lfu.199.1639623204052; 
 Wed, 15 Dec 2021 18:53:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLAutD5nzZlBElDVCzFHJ96E3FPyrYoYz9s2kXrLCpo/2Ls7wuhGFhK7b2w/2ew5RDmh89KNXPnJkqC2JTeU8=
X-Received: by 2002:a05:6512:3987:: with SMTP id
 j7mr12474544lfu.199.1639623203699; 
 Wed, 15 Dec 2021 18:53:23 -0800 (PST)
MIME-Version: 1.0
References: <2cb51a6d-afa0-7cd1-d6f2-6b153186eaca@redhat.com>
 <20210302043419-mutt-send-email-mst@kernel.org>
 <178f8ea7-cebd-0e81-3dc7-10a058d22c07@redhat.com>
 <c9a0932f-a6d7-a9df-38ba-97e50f70c2b2@oracle.com>
 <20211212042311-mutt-send-email-mst@kernel.org>
 <ba9df703-29af-98a9-c554-f303ff045398@oracle.com>
 <20211214000245-mutt-send-email-mst@kernel.org>
 <4fc43d0f-da9e-ce16-1f26-9f0225239b75@oracle.com>
 <CACGkMEsttnFEKGK-aKdCZeXkUnZJg1uaqYzFqpv-g5TobHGSzQ@mail.gmail.com>
 <6eaf672c-cc86-b5bf-5b74-c837affeb6e1@oracle.com>
 <20211215162917-mutt-send-email-mst@kernel.org>
 <71d2a69c-94a7-76b5-2971-570026760bf0@oracle.com>
In-Reply-To: <71d2a69c-94a7-76b5-2971-570026760bf0@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Dec 2021 10:53:12 +0800
Message-ID: <CACGkMEsoMpSLX=YZmsgRQVs7+9dwon7FCDK+VOL6Nx2FYK=_pA@mail.gmail.com>
Subject: Re: vdpa legacy guest support (was Re: [PATCH] vdpa/mlx5:
 set_features should allow reset to zero)
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev <netdev@vger.kernel.org>, Eli Cohen <elic@nvidia.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

T24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgMTA6MDIgQU0gU2ktV2VpIExpdSA8c2ktd2VpLmxpdUBv
cmFjbGUuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxMi8xNS8yMDIxIDE6MzMgUE0sIE1pY2hhZWwg
Uy4gVHNpcmtpbiB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDE1LCAyMDIxIGF0IDEyOjUyOjIwUE0g
LTA4MDAsIFNpLVdlaSBMaXUgd3JvdGU6Cj4gPj4KPiA+PiBPbiAxMi8xNC8yMDIxIDY6MDYgUE0s
IEphc29uIFdhbmcgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgRGVjIDE1LCAyMDIxIGF0IDk6MDUgQU0g
U2ktV2VpIExpdSA8c2ktd2VpLmxpdUBvcmFjbGUuY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBP
biAxMi8xMy8yMDIxIDk6MDYgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4+PiBP
biBNb24sIERlYyAxMywgMjAyMSBhdCAwNTo1OTo0NVBNIC0wODAwLCBTaS1XZWkgTGl1IHdyb3Rl
Ogo+ID4+Pj4+PiBPbiAxMi8xMi8yMDIxIDE6MjYgQU0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+Pj4+Pj4+IE9uIEZyaSwgRGVjIDEwLCAyMDIxIGF0IDA1OjQ0OjE1UE0gLTA4MDAsIFNp
LVdlaSBMaXUgd3JvdGU6Cj4gPj4+Pj4+Pj4gU29ycnkgZm9yIHJldml2aW5nIHRoaXMgYW5jaWVu
dCB0aHJlYWQuIEkgd2FzIGtpbmRhIGxvc3QgZm9yIHRoZSBjb25jbHVzaW9uCj4gPj4+Pj4+Pj4g
aXQgZW5kZWQgdXAgd2l0aC4gSSBoYXZlIHRoZSBmb2xsb3dpbmcgcXVlc3Rpb25zLAo+ID4+Pj4+
Pj4+Cj4gPj4+Pj4+Pj4gMS4gbGVnYWN5IGd1ZXN0IHN1cHBvcnQ6IGZyb20gdGhlIHBhc3QgY29u
dmVyc2F0aW9ucyBpdCBkb2Vzbid0IHNlZW0gdGhlCj4gPj4+Pj4+Pj4gc3VwcG9ydCB3aWxsIGJl
IGNvbXBsZXRlbHkgZHJvcHBlZCBmcm9tIHRoZSB0YWJsZSwgaXMgbXkgdW5kZXJzdGFuZGluZwo+
ID4+Pj4+Pj4+IGNvcnJlY3Q/IEFjdHVhbGx5IHdlJ3JlIGludGVyZXN0ZWQgaW4gc3VwcG9ydGlu
ZyB2aXJ0aW8gdjAuOTUgZ3Vlc3QgZm9yIHg4NiwKPiA+Pj4+Pj4+PiB3aGljaCBpcyBiYWNrZWQg
YnkgdGhlIHNwZWMgYXQKPiA+Pj4+Pj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9vemxhYnMub3JnLypydXN0eS92aXJ0aW8tc3BlYy92aXJ0aW8tMC45LjUucGRmX187Zmch
IUFDV1Y1TjlNMlJWOTloUSFkVEttekp3d1JzRk03QnRTdVREdTFjTmx5NW40WENvdEgwV1ltaWR6
R3FIU1h0NDBpN1pVNDNVY05nN0dZeFpnJCAuIFRob3VnaCBJJ20gbm90IHN1cmUKPiA+Pj4+Pj4+
PiBpZiB0aGVyZSdzIHJlcXVlc3QvbmVlZCB0byBzdXBwb3J0IHdpbGRlciBsZWdhY3kgdmlydGlv
IHZlcnNpb25zIGVhcmxpZXIKPiA+Pj4+Pj4+PiBiZXlvbmQuCj4gPj4+Pj4+PiBJIHBlcnNvbmFs
bHkgZmVlbCBpdCdzIGxlc3Mgd29yayB0byBhZGQgaW4ga2VybmVsIHRoYW4gdHJ5IHRvCj4gPj4+
Pj4+PiB3b3JrIGFyb3VuZCBpdCBpbiB1c2Vyc3BhY2UuIEphc29uIGZlZWxzIGRpZmZlcmVudGx5
Lgo+ID4+Pj4+Pj4gTWF5YmUgcG9zdCB0aGUgcGF0Y2hlcyBhbmQgdGhpcyB3aWxsIHByb3ZlIHRv
IEphc29uIGl0J3Mgbm90Cj4gPj4+Pj4+PiB0b28gdGVycmlibGU/Cj4gPj4+Pj4+IEkgc3VwcG9z
ZSBpZiB0aGUgdmRwYSB2ZW5kb3IgZG9lcyBzdXBwb3J0IDAuOTUgaW4gdGhlIGRhdGFwYXRoIGFu
ZCByaW5nCj4gPj4+Pj4+IGxheW91dCBsZXZlbCBhbmQgaXMgbGltaXRlZCB0byB4ODYgb25seSwg
dGhlcmUgc2hvdWxkIGJlIGVhc3kgd2F5IG91dC4KPiA+Pj4+PiBOb3RlIGEgc3VidGxlIGRpZmZl
cmVuY2U6IHdoYXQgbWF0dGVycyBpcyB0aGF0IGd1ZXN0LCBub3QgaG9zdCBpcyB4ODYuCj4gPj4+
Pj4gTWF0dGVycyBmb3IgZW11bGF0b3JzIHdoaWNoIG1pZ2h0IHJlb3JkZXIgbWVtb3J5IGFjY2Vz
c2VzLgo+ID4+Pj4+IEkgZ3Vlc3MgdGhpcyBlbmZvcmNlbWVudCBiZWxvbmdzIGluIFFFTVUgdGhl
bj8KPiA+Pj4+IFJpZ2h0LCBJIG1lYW4gdG8gZ2V0IHN0YXJ0ZWQsIHRoZSBpbml0aWFsIGd1ZXN0
IGRyaXZlciBzdXBwb3J0IGFuZCB0aGUKPiA+Pj4+IGNvcnJlc3BvbmRpbmcgUUVNVSBzdXBwb3J0
IGZvciB0cmFuc2l0aW9uYWwgdmRwYSBiYWNrZW5kIGNhbiBiZSBsaW1pdGVkCj4gPj4+PiB0byB4
ODYgZ3Vlc3QvaG9zdCBvbmx5LiBTaW5jZSB0aGUgY29uZmlnIHNwYWNlIGlzIGVtdWxhdGVkIGlu
IFFFTVUsIEkKPiA+Pj4+IHN1cHBvc2UgaXQncyBub3QgaGFyZCB0byBlbmZvcmNlIGluIFFFTVUu
Cj4gPj4+IEl0J3MgbW9yZSB0aGFuIGp1c3QgY29uZmlnIHNwYWNlLCBtb3N0IGRldmljZXMgaGF2
ZSBoZWFkZXJzIGJlZm9yZSB0aGUgYnVmZmVyLgo+ID4+IFRoZSBvcmRlcmluZyBpbiBkYXRhcGF0
aCAoZGF0YSBWUXMpIHdvdWxkIGhhdmUgdG8gcmVseSBvbiB2ZW5kb3IncyBzdXBwb3J0Lgo+ID4+
IFNpbmNlIE9SREVSX1BMQVRGT1JNIGlzIHByZXR0eSBuZXcgKHYxLjEpLCBJIGd1ZXNzIHZkcGEg
aC93IHZlbmRvciBub3dhZGF5cwo+ID4+IGNhbi9zaG91bGQgd2VsbCBzdXBwb3J0IHRoZSBjYXNl
IHdoZW4gT1JERVJfUExBVEZPUk0gaXMgbm90IGFja2VkIGJ5IHRoZQo+ID4+IGRyaXZlciAoYWN0
dWFsbHkgdGhpcyBmZWF0dXJlIGlzIGZpbHRlcmVkIG91dCBieSB0aGUgUUVNVSB2aG9zdC12ZHBh
IGRyaXZlcgo+ID4+IHRvZGF5KSwgZXZlbiB3aXRoIHYxLjAgc3BlYyBjb25mb3JtaW5nIGFuZCBt
b2Rlcm4gb25seSB2RFBBIGRldmljZS4gVGhlCj4gPj4gY29udHJvbCBWUSBpcyBpbXBsZW1lbnRl
ZCBpbiBzb2Z0d2FyZSBpbiB0aGUga2VybmVsLCB3aGljaCBjYW4gYmUgZWFzaWx5Cj4gPj4gYWNj
b21tb2RhdGVkL2ZpeGVkIHdoZW4gbmVlZGVkLgo+ID4+Cj4gPj4+PiBRRU1VIGNhbiBkcml2ZSBH
RVRfTEVHQUNZLAo+ID4+Pj4gR0VUX0VORElBTiBldCBhbCBpb2N0bHMgaW4gYWR2YW5jZSB0byBn
ZXQgdGhlIGNhcGFiaWxpdHkgZnJvbSB0aGUKPiA+Pj4+IGluZGl2aWR1YWwgdmVuZG9yIGRyaXZl
ci4gRm9yIHRoYXQsIHdlIG5lZWQgYW5vdGhlciBuZWdvdGlhdGlvbiBwcm90b2NvbAo+ID4+Pj4g
c2ltaWxhciB0byB2aG9zdF91c2VyJ3MgcHJvdG9jb2xfZmVhdHVyZXMgYmV0d2VlbiB0aGUgdmRw
YSBrZXJuZWwgYW5kCj4gPj4+PiBRRU1VLCB3YXkgYmVmb3JlIHRoZSBndWVzdCBkcml2ZXIgaXMg
ZXZlciBwcm9iZWQgYW5kIGl0cyBmZWF0dXJlCj4gPj4+PiBuZWdvdGlhdGlvbiBraWNrcyBpbi4g
Tm90IHN1cmUgd2UgbmVlZCBhIEdFVF9NRU1PUllfT1JERVIgaW9jdGwgY2FsbAo+ID4+Pj4gZnJv
bSB0aGUgZGV2aWNlLCBidXQgd2UgY2FuIGFzc3VtZSB3ZWFrIG9yZGVyaW5nIGZvciBsZWdhY3kg
YXQgdGhpcwo+ID4+Pj4gcG9pbnQgKHg4NiBvbmx5KT8KPiA+Pj4gSSdtIGxvc3QgaGVyZSwgd2Ug
aGF2ZSBnZXRfZmVhdHVyZXMoKSBzbzoKPiA+PiBJIGFzc3VtZSBoZXJlIHlvdSByZWZlciB0byBn
ZXRfZGV2aWNlX2ZlYXR1cmVzKCkgdGhhdCBFbGkganVzdCBjaGFuZ2VkIHRoZQo+ID4+IG5hbWUu
Cj4gPj4+IDEpIFZFUlNJT05fMSBtZWFucyB0aGUgZGV2aWNlIHVzZXMgTEUgaWYgcHJvdmlkZWQs
IG90aGVyd2lzZSBuYXR2aWUKPiA+Pj4gMikgT1JERVJfUExBVEZPUk0gbWVhbnMgZGV2aWNlIHJl
cXVpcmVzIHBsYXRmb3JtIG9yZGVyaW5nCj4gPj4+Cj4gPj4+IEFueSByZWFzb24gZm9yIGhhdmlu
ZyBhIG5ldyBBUEkgZm9yIHRoaXM/Cj4gPj4gQXJlIHlvdSBnb2luZyB0byBlbmZvcmNlIGFsbCB2
RFBBIGhhcmR3YXJlIHZlbmRvcnMgdG8gc3VwcG9ydCB0aGUKPiA+PiB0cmFuc2l0aW9uYWwgbW9k
ZWwgZm9yIGxlZ2FjeSBndWVzdD8KCkRvIHdlIHJlYWxseSBoYXZlIG90aGVyIGNob2ljZXM/CgpJ
IHN1c3BlY3QgdGhlIGxlZ2FjeSBkZXZpY2UgaXMgbmV2ZXIgaW1wbGVtZW50ZWQgYnkgYW55IHZl
bmRvcjoKCjEpIG5vIHZpcnRpbyB3YXkgdG8gZGV0ZWN0IGhvc3QgZW5kaWFuCjIpIGJ5cGFzcyBJ
T01NVSB3aXRoIHRyYW5zbGF0ZWQgcmVxdWVzdHMKMykgUElPIHBvcnQKClllcyB3ZSBoYXZlIGVu
cF92ZHBhLCBidXQgaXQncyBtb3JlIGxpa2UgYSAidHJhbnNpdGlvbmFsIGRldmljZSIgZm9yCmxl
Z2FjeSBvbmx5IGd1ZXN0cy4KCj4gbWVhbmluZyBndWVzdCBub3QgYWNrbm93bGVkZ2luZwo+ID4+
IFZFUlNJT05fMSB3b3VsZCB1c2UgdGhlIGxlZ2FjeSBpbnRlcmZhY2VzIGNhcHR1cmVkIGluIHRo
ZSBzcGVjIHNlY3Rpb24gNy40Cj4gPj4gKHJlZ2FyZGluZyByaW5nIGxheW91dCwgbmF0aXZlIGVu
ZGlhbm5lc3MsIG1lc3NhZ2UgZnJhbWluZywgdnEgYWxpZ25tZW50IG9mCj4gPj4gNDA5NiwgMzJi
aXQgZmVhdHVyZSwgbm8gZmVhdHVyZXNfb2sgYml0IGluIHN0YXR1cywgSU8gcG9ydCBpbnRlcmZh
Y2UgaS5lLgo+ID4+IGFsbCB0aGUgdGhpbmdzKSBpbnN0ZWFkPwoKTm90ZSB0aGF0IHdlIG9ubHkg
Y2FyZSBhYm91dCB0aGUgZGF0YXBhdGgsIGNvbnRyb2wgcGF0aCBpcyBtZWRpYXRlZCBhbnlob3cu
CgpTbyBmZWF0dXJlX29rIGFuZCBJTyBwb3J0IGlzbid0IGFuIGlzc3VlLiBUaGUgcmVzdCBsb29r
cyBsaWtlIGEgbXVzdApmb3IgdGhlIGhhcmR3YXJlLgoKPiBOb3RlZCB3ZSBkb24ndCB5ZXQgaGF2
ZSBhIHNldF9kZXZpY2VfZmVhdHVyZXMoKQo+ID4+IHRoYXQgYWxsb3dzIHRoZSB2ZHBhIGRldmlj
ZSB0byB0ZWxsIHdoZXRoZXIgaXQgaXMgb3BlcmF0aW5nIGluIHRyYW5zaXRpb25hbAo+ID4+IG9y
IG1vZGVybi1vbmx5IG1vZGUuCgpTbyB0aGUgZGV2aWNlIGZlYXR1cmUgc2hvdWxkIGJlIHByb3Zp
c2lvbmVkIHZpYSB0aGUgbmV0bGluayBwcm90b2NvbC4KQW5kIHdoYXQgd2Ugd2FudCBpcyBub3Qg
InNldF9kZXZpY2VfZmVhdHVyZSgpIiBidXQKInNldF9kZXZpY2VfbWFuZGF0b3J5X2ZlYXV0cmUo
KSIsIHRoZW4gdGhlIHBhcmVudCBjYW4gY2hvb3NlIHRvIGZhaWwKdGhlIG5lZ290aWF0aW9uIHdo
ZW4gVkVSU0lPTl8xIGlzIG5vdCBuZWdvdGlhdGVkLiBRZW11IHRoZW4ga25vd3MgZm9yCnN1cmUg
aXQgdGFsa3MgdG8gYSB0cmFuc2l0aW9uYWwgZGV2aWNlIG9yIG1vZGVybiBvbmx5IGRldmljZS4K
ClRoYW5rcwoKPiBGb3Igc29mdHdhcmUgdmlydGlvLCBhbGwgc3VwcG9ydCBmb3IgdGhlIGxlZ2Fj
eSBwYXJ0IGluCj4gPj4gYSB0cmFuc2l0aW9uYWwgbW9kZWwgaGFzIGJlZW4gYnVpbHQgdXAgdGhl
cmUgYWxyZWFkeSwgaG93ZXZlciwgaXQncyBub3QgZWFzeQo+ID4+IGZvciB2RFBBIHZlbmRvcnMg
dG8gaW1wbGVtZW50IGFsbCB0aGUgcmVxdWlyZW1lbnRzIGZvciBhbiBhbGwtb3Itbm90aGluZwo+
ID4+IGxlZ2FjeSBndWVzdCBzdXBwb3J0IChiaWcgZW5kaWFuIGd1ZXN0IGZvciBleGFtcGxlKS4g
VG8gdGhlc2UgdmVuZG9ycywgdGhlCj4gPj4gbGVnYWN5IHN1cHBvcnQgd2l0aGluIGEgdHJhbnNp
dGlvbmFsIG1vZGVsIGlzIG1vcmUgb2YgZmVhdHVyZSB0byB0aGVtIGFuZAo+ID4+IGl0J3MgYmVz
dCB0byBsZWF2ZSBzb21lIGZsZXhpYmlsaXR5IGZvciB0aGVtIHRvIGltcGxlbWVudCBwYXJ0aWFs
IHN1cHBvcnQKPiA+PiBmb3IgbGVnYWN5LiBUaGF0IGluIHR1cm4gY2FsbHMgb3V0IHRoZSBuZWVk
IGZvciBhIHZob3N0LXVzZXIgcHJvdG9jb2wKPiA+PiBmZWF0dXJlIGxpa2UgbmVnb3RpYXRpb24g
QVBJIHRoYXQgY2FuIHByb2hpYml0IHRob3NlIHVuc3VwcG9ydGVkIGd1ZXN0Cj4gPj4gc2V0dXBz
IHRvIGFzIGVhcmx5IGFzIGJhY2tlbmRfaW5pdCBiZWZvcmUgbGF1bmNoaW5nIHRoZSBWTS4KPiA+
IFJpZ2h0LiBPZiBub3RlIGlzIHRoZSBmYWN0IHRoYXQgaXQncyBhIHNwZWMgYnVnIHdoaWNoIEkK
PiA+IGhvcGUgeWV0IHRvIGZpeCwgdGhvdWdoIGR1ZSB0byBleGlzdGluZyBndWVzdCBjb2RlIHRo
ZQo+ID4gZml4IHdvbid0IGJlIGNvbXBsZXRlLgo+IEkgdGhvdWdodCBhdCBvbmUgcG9pbnQgeW91
IHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQgdGhlIHNwZWMgZG9lcyBhbGxvdwo+IGNvbmZpZyBzcGFj
ZSByZWFkIGJlZm9yZSBjbGFpbWluZyBmZWF0dXJlc19vaywgYW5kIG9ubHkgY29uZmlnIHdyaXRl
Cj4gYmVmb3JlIGZlYXR1cmVzX29rIGlzIHByb2hpYml0ZWQuIEkgaGF2ZW4ndCByZWFkIHVwIHRo
ZSBmdWxsIHRocmVhZCBvZgo+IEhhbGlsJ3MgVkVSU0lPTl8xIGZvciB0cmFuc2l0aW9uYWwgYmln
IGVuZGlhbiBkZXZpY2UgeWV0LCBidXQgd2hhdCBpcwo+IHRoZSBzcGVjIGJ1ZyB5b3UgaG9wZSB0
byBmaXg/Cj4KPiA+Cj4gPiBXUlQgaW9jdGxzLCBPbmUgdGhpbmcgd2UgY2FuIGRvIHRob3VnaCBp
cyBhYnVzZSBzZXRfZmVhdHVyZXMKPiA+IHdoZXJlIGl0J3MgY2FsbGVkIGJ5IFFFTVUgZWFybHkg
b24gd2l0aCBqdXN0IHRoZSBWRVJTSU9OXzEKPiA+IGJpdCBzZXQsIHRvIGRpc3Rpbmd1aXNoIGJl
dHdlZW4gbGVnYWN5IGFuZCBtb2Rlcm4KPiA+IGludGVyZmFjZS4gVGhpcyBiZWZvcmUgY29uZmln
IHNwYWNlIGFjY2Vzc2VzIGFuZCBGRUFUVVJFU19PSy4KPiA+Cj4gPiBIYWxpbCBoYXMgYmVlbiB3
b3JraW5nIG9uIHRoaXMsIHBscyB0YWtlIGEgbG9vayBhbmQgbWF5YmUgaGVscCBoaW0gb3V0Lgo+
IEludGVyZXN0aW5nIHRocmVhZCwgYW0gcmVhZGluZyBub3cgYW5kIHNlZSBob3cgSSBtYXkgbGV2
ZXJhZ2Ugb3IgaGVscCB0aGVyZS4KPgo+ID4+Pj4+PiBJCj4gPj4+Pj4+IGNoZWNrZWQgd2l0aCBF
bGkgYW5kIG90aGVyIE1lbGxhbm94L05WRElBIGZvbGtzIGZvciBoYXJkd2FyZS9maXJtd2FyZSBs
ZXZlbAo+ID4+Pj4+PiAwLjk1IHN1cHBvcnQsIGl0IHNlZW1zIGFsbCB0aGUgaW5ncmVkaWVudCBo
YWQgYmVlbiB0aGVyZSBhbHJlYWR5IGRhdGVkIGJhY2sKPiA+Pj4+Pj4gdG8gdGhlIERQREsgZGF5
cy4gVGhlIG9ubHkgbWFqb3IgdGhpbmcgbGltaXRpbmcgaXMgaW4gdGhlIHZEUEEgc29mdHdhcmUg
dGhhdAo+ID4+Pj4+PiB0aGUgY3VycmVudCB2ZHBhIGNvcmUgaGFzIHRoZSBhc3N1bXB0aW9uIGFy
b3VuZCBWSVJUSU9fRl9BQ0NFU1NfUExBVEZPUk0gZm9yCj4gPj4+Pj4+IGEgZmV3IERNQSBzZXR1
cCBvcHMsIHdoaWNoIGlzIHZpcnRpbyAxLjAgb25seS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4+PiAyLiBz
dXBwb3NlIHNvbWUgZm9ybSBvZiBsZWdhY3kgZ3Vlc3Qgc3VwcG9ydCBuZWVkcyB0byBiZSB0aGVy
ZSwgaG93IGRvIHdlCj4gPj4+Pj4+Pj4gZGVhbCB3aXRoIHRoZSBib2d1cyBhc3N1bXB0aW9uIGJl
bG93IGluIHZkcGFfZ2V0X2NvbmZpZygpIGluIHRoZSBzaG9ydCB0ZXJtPwo+ID4+Pj4+Pj4+IEl0
IGxvb2tzIG9uZSBvZiB0aGUgaW50dWl0aXZlIGZpeCBpcyB0byBtb3ZlIHRoZSB2ZHBhX3NldF9m
ZWF0dXJlcyBjYWxsIG91dAo+ID4+Pj4+Pj4+IG9mIHZkcGFfZ2V0X2NvbmZpZygpIHRvIHZkcGFf
c2V0X2NvbmZpZygpLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gICAgICAgICAgICAgLyoKPiA+Pj4+
Pj4+PiAgICAgICAgICAgICAgKiBDb25maWcgYWNjZXNzZXMgYXJlbid0IHN1cHBvc2VkIHRvIHRy
aWdnZXIgYmVmb3JlIGZlYXR1cmVzIGFyZQo+ID4+Pj4+Pj4+IHNldC4KPiA+Pj4+Pj4+PiAgICAg
ICAgICAgICAgKiBJZiBpdCBkb2VzIGhhcHBlbiB3ZSBhc3N1bWUgYSBsZWdhY3kgZ3Vlc3QuCj4g
Pj4+Pj4+Pj4gICAgICAgICAgICAgICovCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgaWYgKCF2ZGV2
LT5mZWF0dXJlc192YWxpZCkKPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgIHZkcGFfc2V0
X2ZlYXR1cmVzKHZkZXYsIDApOwo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIG9wcy0+Z2V0X2NvbmZp
Zyh2ZGV2LCBvZmZzZXQsIGJ1ZiwgbGVuKTsKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEkgY2FuIHBv
c3QgYSBwYXRjaCB0byBmaXggMikgaWYgdGhlcmUncyBjb25zZW5zdXMgYWxyZWFkeSByZWFjaGVk
Lgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gVGhhbmtzLAo+ID4+Pj4+Pj4+IC1TaXdlaQo+ID4+Pj4+
Pj4gSSdtIG5vdCBzdXJlIGhvdyBpbXBvcnRhbnQgaXQgaXMgdG8gY2hhbmdlIHRoYXQuCj4gPj4+
Pj4+PiBJbiBhbnkgY2FzZSBpdCBvbmx5IGFmZmVjdHMgdHJhbnNpdGlvbmFsIGRldmljZXMsIHJp
Z2h0Pwo+ID4+Pj4+Pj4gTGVnYWN5IG9ubHkgc2hvdWxkIG5vdCBjYXJlIC4uLgo+ID4+Pj4+PiBZ
ZXMgSSdkIGxpa2UgdG8gZGlzdGluZ3Vpc2ggbGVnYWN5IGRyaXZlciAoc3VwcG9zZSBpdCBpcyAw
Ljk1KSBhZ2FpbnN0IHRoZQo+ID4+Pj4+PiBtb2Rlcm4gb25lIGluIGEgdHJhbnNpdGlvbmFsIGRl
dmljZSBtb2RlbCByYXRoZXIgdGhhbiBiZWluZyBsZWdhY3kgb25seS4KPiA+Pj4+Pj4gVGhhdCB3
YXkgYSB2MC45NSBhbmQgdjEuMCBzdXBwb3J0aW5nIHZkcGEgcGFyZW50IGNhbiBzdXBwb3J0IGJv
dGggdHlwZXMgb2YKPiA+Pj4+Pj4gZ3Vlc3RzIHdpdGhvdXQgaGF2aW5nIHRvIHJlY29uZmlndXJl
LiBPciBhcmUgeW91IHN1Z2dlc3RpbmcgbGltaXQgdG8gbGVnYWN5Cj4gPj4+Pj4+IG9ubHkgYXQg
dGhlIHRpbWUgb2YgdmRwYSBjcmVhdGlvbiB3b3VsZCBzaW1wbGlmeSB0aGUgaW1wbGVtZW50YXRp
b24gYSBsb3Q/Cj4gPj4+Pj4+Cj4gPj4+Pj4+IFRoYW5rcywKPiA+Pj4+Pj4gLVNpd2VpCj4gPj4+
Pj4gSSBkb24ndCBrbm93IGZvciBzdXJlLiBUYWtlIGEgbG9vayBhdCB0aGUgd29yayBIYWxpbCB3
YXMgZG9pbmcKPiA+Pj4+PiB0byB0cnkgYW5kIHN1cHBvcnQgdHJhbnNpdGlvbmFsIGRldmljZXMg
d2l0aCBCRSBndWVzdHMuCj4gPj4+PiBIbW1tLCB3ZSBjYW4gaGF2ZSB0aG9zZSBlbmRpYW5uZXNz
IGlvY3RscyBkZWZpbmVkIGJ1dCB0aGUgaW5pdGlhbCBRRU1VCj4gPj4+PiBpbXBsZW1lbnRhdGlv
biBjYW4gYmUgc3RhcnRlZCB0byBzdXBwb3J0IHg4NiBndWVzdC9ob3N0IHdpdGggbGl0dGxlCj4g
Pj4+PiBlbmRpYW4gYW5kIHdlYWsgbWVtb3J5IG9yZGVyaW5nIGZpcnN0LiBUaGUgcmVhbCB0cmlj
ayBpcyB0byBkZXRlY3QKPiA+Pj4+IGxlZ2FjeSBndWVzdCAtIEkgYW0gbm90IHN1cmUgaWYgaXQn
cyBmZWFzaWJsZSB0byBzaGlmdCBhbGwgdGhlIGxlZ2FjeQo+ID4+Pj4gZGV0ZWN0aW9uIHdvcmsg
dG8gUUVNVSwgb3IgdGhlIGtlcm5lbCBoYXMgdG8gYmUgcGFydCBvZiB0aGUgZGV0ZWN0aW9uCj4g
Pj4+PiAoZS5nLiB0aGUga2ljayBiZWZvcmUgRFJJVkVSX09LIHRoaW5nIHdlIGhhdmUgdG8gZHVw
bGljYXRlIHRoZSB0cmFja2luZwo+ID4+Pj4gZWZmb3J0IGluIFFFTVUpIGFzIHdlbGwuIExldCBt
ZSB0YWtlIGEgZnVydGhlciBsb29rIGFuZCBnZXQgYmFjay4KPiA+Pj4gTWljaGFlbCBtYXkgdGhp
bmsgZGlmZmVyZW50bHkgYnV0IEkgdGhpbmsgZG9pbmcgdGhpcyBpbiBRZW11IGlzIG11Y2ggZWFz
aWVyLgo+ID4+IEkgdGhpbmsgdGhlIGtleSBpcyB3aGV0aGVyIHdlIHBvc2l0aW9uIGVtdWxhdGlu
ZyBsZWdhY3kgaW50ZXJmYWNlcyBpbiBRRU1VCj4gPj4gZG9pbmcgdHJhbnNsYXRpb24gb24gdG9w
IG9mIGEgdjEuMCBtb2Rlcm4tb25seSBkZXZpY2UgaW4gdGhlIGtlcm5lbCwgb3Igd2UKPiA+PiBh
bGxvdyB2ZHBhIGNvcmUgKG9yIHlvdSBjYW4gc2F5IHZob3N0LXZkcGEpIGFuZCB2ZW5kb3IgZHJp
dmVyIHRvIHN1cHBvcnQgYQo+ID4+IHRyYW5zaXRpb25hbCBtb2RlbCBpbiB0aGUga2VybmVsIHRo
YXQgaXMgYWJsZSB0byB3b3JrIGZvciBib3RoIHYwLjk1IGFuZAo+ID4+IHYxLjAgZHJpdmVycywg
d2l0aCBzb21lIHNsaWdodCBhaWQgZnJvbSBRRU1VIGZvcgo+ID4+IGRldGVjdGluZy9lbXVsYXRp
b24vc2hhZG93aW5nIChmb3IgZS5nIENWUSwgSS9PIHBvcnQgcmVsYXkpLiBJIGd1ZXNzIGZvciB0
aGUKPiA+PiBmb3JtZXIgd2Ugc3RpbGwgcmVseSBvbiB2ZW5kb3IgZm9yIGEgcGVyZm9ybWFudCBk
YXRhIHZxcyBpbXBsZW1lbnRhdGlvbiwKPiA+PiBsZWF2aW5nIHRoZSBxdWVzdGlvbiB0byB3aGF0
IGl0IG1heSBlbmQgdXAgZXZlbnR1YWxseSBpbiB0aGUga2VybmVsIGlzCj4gPj4gZWZmZWN0aXZl
bHkgdGhlIGxhdHRlcikuCj4gPj4KPiA+PiBUaGFua3MsCj4gPj4gLVNpd2VpCj4gPgo+ID4gTXkg
c3VnZ2VzdGlvbiBpcyBwb3N0IHRoZSBrZXJuZWwgcGF0Y2hlcywgYW5kIHdlIGNhbiBldmFsdWF0
ZQo+ID4gaG93IG11Y2ggd29yayB0aGV5IGFyZS4KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4g
SSB3aWxsIHRha2Ugc29tZSByZWFkIHRoZW4gZ2V0IGJhY2ssIHByb2JhYmx5Cj4gYWZ0ZXIgdGhl
IHdpbnRlciBicmVhay4gU3RheSB0dW5lZC4KPgo+IFRoYW5rcywKPiAtU2l3ZWkKPgo+ID4KPiA+
Pj4gVGhhbmtzCj4gPj4+Cj4gPj4+Cj4gPj4+Cj4gPj4+PiBNZWFud2hpbGUsIEknbGwgY2hlY2sg
aW50ZXJuYWxseSB0byBzZWUgaWYgYSBsZWdhY3kgb25seSBtb2RlbCB3b3VsZAo+ID4+Pj4gd29y
ay4gVGhhbmtzLgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4+IC1TaXdlaQo+ID4+Pj4KPiA+
Pj4+Cj4gPj4+Pj4+Pj4gT24gMy8yLzIwMjEgMjo1MyBBTSwgSmFzb24gV2FuZyB3cm90ZToKPiA+
Pj4+Pj4+Pj4gT24gMjAyMS8zLzIgNTo0NyDkuIvljYgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+Pj4+Pj4+Pj4+IE9uIE1vbiwgTWFyIDAxLCAyMDIxIGF0IDExOjU2OjUwQU0gKzA4MDAs
IEphc29uIFdhbmcgd3JvdGU6Cj4gPj4+Pj4+Pj4+Pj4gT24gMjAyMS8zLzEgNTozNCDkuIrljYgs
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4+Pj4+Pj4+Pj4gT24gV2VkLCBGZWIgMjQs
IDIwMjEgYXQgMTA6MjQ6NDFBTSAtMDgwMCwgU2ktV2VpIExpdSB3cm90ZToKPiA+Pj4+Pj4+Pj4+
Pj4+PiBEZXRlY3RpbmcgaXQgaXNuJ3QgZW5vdWdoIHRob3VnaCwgd2Ugd2lsbCBuZWVkIGEgbmV3
IGlvY3RsIHRvIG5vdGlmeQo+ID4+Pj4+Pj4+Pj4+Pj4+IHRoZSBrZXJuZWwgdGhhdCBpdCdzIGEg
bGVnYWN5IGd1ZXN0LiBVZ2ggOigKPiA+Pj4+Pj4+Pj4+Pj4+IFdlbGwsIGFsdGhvdWdoIEkgdGhp
bmsgYWRkaW5nIGFuIGlvY3RsIGlzIGRvYWJsZSwgbWF5IEkKPiA+Pj4+Pj4+Pj4+Pj4+IGtub3cg
d2hhdCB0aGUgdXNlCj4gPj4+Pj4+Pj4+Pj4+PiBjYXNlIHRoZXJlIHdpbGwgYmUgZm9yIGtlcm5l
bCB0byBsZXZlcmFnZSBzdWNoIGluZm8KPiA+Pj4+Pj4+Pj4+Pj4+IGRpcmVjdGx5PyBJcyB0aGVy
ZSBhCj4gPj4+Pj4+Pj4+Pj4+PiBjYXNlIFFFTVUgY2FuJ3QgZG8gd2l0aCBkZWRpY2F0ZSBpb2N0
bHMgbGF0ZXIgaWYgdGhlcmUncyBpbmRlZWQKPiA+Pj4+Pj4+Pj4+Pj4+IGRpZmZlcmVudGlhdGlv
biAobGVnYWN5IHYucy4gbW9kZXJuKSBuZWVkZWQ/Cj4gPj4+Pj4+Pj4+Pj4+IEJUVyBhIGdvb2Qg
QVBJIGNvdWxkIGJlCj4gPj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+ICNkZWZpbmUgVkhPU1Rf
U0VUX0VORElBTiBfSU9XKFZIT1NUX1ZJUlRJTywgPywgaW50KQo+ID4+Pj4+Pj4+Pj4+PiAjZGVm
aW5lIFZIT1NUX0dFVF9FTkRJQU4gX0lPVyhWSE9TVF9WSVJUSU8sID8sIGludCkKPiA+Pj4+Pj4+
Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4gd2UgZGlkIGl0IHBlciB2cmluZyBidXQgbWF5YmUgdGhhdCB3
YXMgYSBtaXN0YWtlIC4uLgo+ID4+Pj4+Pj4+Pj4+IEFjdHVhbGx5LCBJIHdvbmRlciB3aGV0aGVy
IGl0J3MgZ29vZCB0aW1lIHRvIGp1c3Qgbm90IHN1cHBvcnQKPiA+Pj4+Pj4+Pj4+PiBsZWdhY3kg
ZHJpdmVyCj4gPj4+Pj4+Pj4+Pj4gZm9yIHZEUEEuIENvbnNpZGVyOgo+ID4+Pj4+Pj4+Pj4+Cj4g
Pj4+Pj4+Pj4+Pj4gMSkgSXQncyBkZWZpbml0aW9uIGlzIG5vLW5vcm1hdGl2ZQo+ID4+Pj4+Pj4+
Pj4+IDIpIEEgbG90IG9mIGJ1ZHJlbiBvZiBjb2Rlcwo+ID4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+
Pj4gU28gcWVtdSBjYW4gc3RpbGwgcHJlc2VudCB0aGUgbGVnYWN5IGRldmljZSBzaW5jZSB0aGUg
Y29uZmlnCj4gPj4+Pj4+Pj4+Pj4gc3BhY2Ugb3Igb3RoZXIKPiA+Pj4+Pj4+Pj4+PiBzdHVmZnMg
dGhhdCBpcyBwcmVzZW50ZWQgYnkgdmhvc3QtdkRQQSBpcyBub3QgZXhwZWN0ZWQgdG8gYmUKPiA+
Pj4+Pj4+Pj4+PiBhY2Nlc3NlZCBieQo+ID4+Pj4+Pj4+Pj4+IGd1ZXN0IGRpcmVjdGx5LiBRZW11
IGNhbiBkbyB0aGUgZW5kaWFuIGNvbnZlcnNpb24gd2hlbiBuZWNlc3NhcnkKPiA+Pj4+Pj4+Pj4+
PiBpbiB0aGlzCj4gPj4+Pj4+Pj4+Pj4gY2FzZT8KPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+
IFRoYW5rcwo+ID4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+PiBPdmVyYWxsIEkgd291bGQgYmUgZmlu
ZSB3aXRoIHRoaXMgYXBwcm9hY2ggYnV0IHdlIG5lZWQgdG8gYXZvaWQgYnJlYWtpbmcKPiA+Pj4+
Pj4+Pj4+IHdvcmtpbmcgdXNlcnNwYWNlLCBxZW11IHJlbGVhc2VzIHdpdGggdmRwYSBzdXBwb3J0
IGFyZSBvdXQgdGhlcmUgYW5kCj4gPj4+Pj4+Pj4+PiBzZWVtIHRvIHdvcmsgZm9yIHBlb3BsZS4g
QW55IGNoYW5nZXMgbmVlZCB0byB0YWtlIHRoYXQgaW50byBhY2NvdW50Cj4gPj4+Pj4+Pj4+PiBh
bmQgZG9jdW1lbnQgY29tcGF0aWJpbGl0eSBjb25jZXJucy4KPiA+Pj4+Pj4+Pj4gQWdyZWUsIGxl
dCBtZSBjaGVjay4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+ICAgICAgIEkg
bm90ZSB0aGF0IGFueSBoYXJkd2FyZQo+ID4+Pj4+Pj4+Pj4gaW1wbGVtZW50YXRpb24gaXMgYWxy
ZWFkeSBicm9rZW4gZm9yIGxlZ2FjeSBleGNlcHQgb24gcGxhdGZvcm1zIHdpdGgKPiA+Pj4+Pj4+
Pj4+IHN0cm9uZyBvcmRlcmluZyB3aGljaCBtaWdodCBiZSBoZWxwZnVsIGluIHJlZHVjaW5nIHRo
ZSBzY29wZS4KPiA+Pj4+Pj4+Pj4gWWVzLgo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBUaGFua3MK
PiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
