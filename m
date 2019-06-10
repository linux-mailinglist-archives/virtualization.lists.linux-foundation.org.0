Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC93B181
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 11:08:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D994D255;
	Mon, 10 Jun 2019 09:08:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63CF5255
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 09:08:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2BEA6174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 09:08:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7368330984D1;
	Mon, 10 Jun 2019 09:08:07 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-103.sin2.redhat.com
	[10.67.116.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9D5060BF1;
	Mon, 10 Jun 2019 09:07:36 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-acpi@vger.kernel.org, qemu-devel@nongnu.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v11 0/7] virtio pmem driver 
Date: Mon, 10 Jun 2019 14:37:23 +0530
Message-Id: <20190610090730.8589-1-pagupta@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 10 Jun 2019 09:08:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, rdunlap@infradead.org, jack@suse.cz, snitzer@redhat.com,
	mst@redhat.com, david@fromorbit.com, lcapitulino@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	darrick.wong@oracle.com, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org, jmoyer@redhat.com,
	nilal@redhat.com, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval.shaia@oracle.com, stefanha@redhat.com,
	pbonzini@redhat.com, dan.j.williams@intel.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHJlYWR5IHRvIGJlIG1lcmdlZCB2aWEgbnZkaW1tIHRyZWUK
IGFzIGRpc2N1c3NlZCB3aXRoIERhbi4gV2UgaGF2ZSBhY2svcmV2aWV3IG9uIFhGUywgRVhUNCAm
CiBWSVJUSU8gcGF0Y2hlcy4gTmVlZCBhbiBhY2sgb24gZGV2aWNlIG1hcHBlciBjaGFuZ2UgaW4K
IHBhdGNoIDQuCgogTWlrZSwgQ2FuIHlvdSBwbGVhc2UgcmV2aWV3IGFuZCBhY2sgcGF0Y2g0LgoK
IFRoaXMgdmVyc2lvbiBkb2VzIG5vdCBoYXMgYW55IGFkZGl0b25hbCBjb2RlIGNoYW5nZSBmcm9t
IHYxMCAKIGFuZCBpcyBvbmx5IHJlYmFzZSBvZiB2MTAgb24gTGludXggNS4yLXJjNCB3aGljaCBp
cyByZXF1aXJlZCAKIGZvciBwYXRjaDQuIEtlZXBpbmcgYWxsIHRoZSBleGlzdGluZyByLW8tYnMu
IEpha29iIENDZWQgYWxzbwogdGVzdGVkIHRoZSBwYXRjaCBzZXJpZXMgYW5kIGNvbmZpcm1lZCB0
aGUgd29ya2luZyBvZiB2OS4KIC0tLQoKIFRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBpbXBsZW1lbnRh
dGlvbiBmb3IgInZpcnRpbyBwbWVtIi4gCiAidmlydGlvIHBtZW0iIGlzIGZha2UgcGVyc2lzdGVu
dCBtZW1vcnkobnZkaW1tKSBpbiBndWVzdCAKIHdoaWNoIGFsbG93cyB0byBieXBhc3MgdGhlIGd1
ZXN0IHBhZ2UgY2FjaGUuIFRoaXMgYWxzbwogaW1wbGVtZW50cyBhIFZJUlRJTyBiYXNlZCBhc3lu
Y2hyb25vdXMgZmx1c2ggbWVjaGFuaXNtLiAgCiAKIFNoYXJpbmcgZ3Vlc3Qga2VybmVsIGRyaXZl
ciBpbiB0aGlzIHBhdGNoc2V0IHdpdGggdGhlIAogY2hhbmdlcyBzdWdnZXN0ZWQgaW4gdjQuIFRl
c3RlZCB3aXRoIFFlbXUgc2lkZSBkZXZpY2UgCiBlbXVsYXRpb24gWzVdIGZvciB2aXJ0aW8tcG1l
bS4gRG9jdW1lbnRlZCB0aGUgaW1wYWN0IG9mCiBwb3NzaWJsZSBwYWdlIGNhY2hlIHNpZGUgY2hh
bm5lbCBhdHRhY2tzIHdpdGggc3VnZ2VzdGVkCiBjb3VudGVybWVhc3VyZXMuCgogRGV0YWlscyBv
ZiBwcm9qZWN0IGlkZWEgZm9yICd2aXJ0aW8gcG1lbScgZmx1c2hpbmcgaW50ZXJmYWNlIAogaXMg
c2hhcmVkIFszXSAmIFs0XS4KCiBJbXBsZW1lbnRhdGlvbiBpcyBkaXZpZGVkIGludG8gdHdvIHBh
cnRzOgogTmV3IHZpcnRpbyBwbWVtIGd1ZXN0IGRyaXZlciBhbmQgcWVtdSBjb2RlIGNoYW5nZXMg
Zm9yIG5ldyAKIHZpcnRpbyBwbWVtIHBhcmF2aXJ0dWFsaXplZCBkZXZpY2UuCgoxLiBHdWVzdCB2
aXJ0aW8tcG1lbSBrZXJuZWwgZHJpdmVyCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogICAtIFJlYWRzIHBlcnNpc3RlbnQgbWVtb3J5IHJhbmdlIGZyb20gcGFyYXZpcnQgZGV2aWNl
IGFuZCAKICAgICByZWdpc3RlcnMgd2l0aCAnbnZkaW1tX2J1cycuICAKICAgLSAnbnZkaW1tL3Bt
ZW0nIGRyaXZlciB1c2VzIHRoaXMgaW5mb3JtYXRpb24gdG8gYWxsb2NhdGUgCiAgICAgcGVyc2lz
dGVudCBtZW1vcnkgcmVnaW9uIGFuZCBzZXR1cCBmaWxlc3lzdGVtIG9wZXJhdGlvbnMgCiAgICAg
dG8gdGhlIGFsbG9jYXRlZCBtZW1vcnkuIAogICAtIHZpcnRpbyBwbWVtIGRyaXZlciBpbXBsZW1l
bnRzIGFzeW5jaHJvbm91cyBmbHVzaGluZyAKICAgICBpbnRlcmZhY2UgdG8gZmx1c2ggZnJvbSBn
dWVzdCB0byBob3N0LgoKMi4gUWVtdSB2aXJ0aW8tcG1lbSBkZXZpY2UKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAgIC0gQ3JlYXRlcyB2aXJ0aW8gcG1lbSBkZXZpY2UgYW5kIGV4
cG9zZXMgYSBtZW1vcnkgcmFuZ2UgdG8gCiAgICAgS1ZNIGd1ZXN0LiAKICAgLSBBdCBob3N0IHNp
ZGUgdGhpcyBpcyBmaWxlIGJhY2tlZCBtZW1vcnkgd2hpY2ggYWN0cyBhcyAKICAgICBwZXJzaXN0
ZW50IG1lbW9yeS4gCiAgIC0gUWVtdSBzaWRlIGZsdXNoIHVzZXMgYWlvIHRocmVhZCBwb29sIEFQ
SSdzIGFuZCB2aXJ0aW8gCiAgICAgZm9yIGFzeW5jaHJvbm91cyBndWVzdCBtdWx0aSByZXF1ZXN0
IGhhbmRsaW5nLiAKCiBWaXJ0aW8tcG1lbSBzZWN1cml0eSBpbXBsaWNhdGlvbnMgYW5kIGNvdW50
ZXJtZWFzdXJlczoKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCgogSW4gcHJldmlvdXMgcG9zdGluZyBvZiBrZXJuZWwgZHJpdmVyLCB0aGVyZSB3
YXMgZGlzY3Vzc2lvbiBbN10KIG9uIHBvc3NpYmxlIGltcGxpY2F0aW9ucyBvZiBwYWdlIGNhY2hl
IHNpZGUgY2hhbm5lbCBhdHRhY2tzIHdpdGggCiB2aXJ0aW8gcG1lbS4gQWZ0ZXIgdGhvcm91Z2gg
YW5hbHlzaXMgb2YgZGV0YWlscyBvZiBrbm93biBzaWRlIAogY2hhbm5lbCBhdHRhY2tzLCBiZWxv
dyBhcmUgdGhlIHN1Z2dlc3Rpb25zOgoKIC0gRGVwZW5kcyBlbnRpcmVseSBvbiBob3cgaG9zdCBi
YWNraW5nIGltYWdlIGZpbGUgaXMgbWFwcGVkIAogICBpbnRvIGd1ZXN0IGFkZHJlc3Mgc3BhY2Uu
IAoKIC0gdmlydGlvLXBtZW0gZGV2aWNlIGVtdWxhdGlvbiwgYnkgZGVmYXVsdCBzaGFyZWQgbWFw
cGluZyBpcyB1c2VkCiAgIHRvIG1hcCBob3N0IGJhY2tpbmcgZmlsZS4gSXQgaXMgcmVjb21tZW5k
ZWQgdG8gdXNlIHNlcGFyYXRlCiAgIGJhY2tpbmcgZmlsZSBhdCBob3N0IHNpZGUgZm9yIGV2ZXJ5
IGd1ZXN0LiBUaGlzIHdpbGwgcHJldmVudAogICBhbnkgcG9zc2liaWxpdHkgb2YgZXhlY3V0aW5n
IGNvbW1vbiBjb2RlIGZyb20gbXVsdGlwbGUgZ3Vlc3RzCiAgIGFuZCBhbnkgY2hhbmNlIG9mIGlu
ZmVycmluZyBndWVzdCBsb2NhbCBkYXRhIGJhc2VkIGJhc2VkIG9uIAogICBleGVjdXRpb24gdGlt
ZS4KCiAtIElmIGJhY2tpbmcgZmlsZSBpcyByZXF1aXJlZCB0byBiZSBzaGFyZWQgYW1vbmcgbXVs
dGlwbGUgZ3Vlc3RzIAogICBpdCBpcyByZWNvbW1lbmRlZCB0byBkb24ndCBzdXBwb3J0IGhvc3Qg
cGFnZSBjYWNoZSBldmljdGlvbiAKICAgY29tbWFuZHMgZnJvbSB0aGUgZ3Vlc3QgZHJpdmVyLiBU
aGlzIHdpbGwgYXZvaWQgYW55IHBvc3NpYmlsaXR5CiAgIG9mIGluZmVycmluZyBndWVzdCBsb2Nh
bCBkYXRhIG9yIGhvc3QgZGF0YSBmcm9tIGFub3RoZXIgZ3Vlc3QuIAoKIC0gUHJvcG9zZWQgZGV2
aWNlIHNwZWNpZmljYXRpb24gWzZdIGZvciB2aXJ0aW8tcG1lbSBkZXZpY2Ugd2l0aCAKICAgZGV0
YWlscyBvZiBwb3NzaWJsZSBzZWN1cml0eSBpbXBsaWNhdGlvbnMgYW5kIHN1Z2dlc3RlZCAKICAg
Y291bnRlcm1lYXN1cmVzIGZvciBkZXZpY2UgZW11bGF0aW9uLgoKIFZpcnRpby1wbWVtIGVycm9y
cyBoYW5kbGluZzoKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICBD
aGVja2VkIGJlaGF2aW91ciBvZiB2aXJ0aW8tcG1lbSBmb3IgYmVsb3cgdHlwZXMgb2YgZXJyb3Jz
CiAgTmVlZCBzdWdnZXN0aW9ucyBvbiBleHBlY3RlZCBiZWhhdmlvdXIgZm9yIGhhbmRsaW5nIHRo
ZXNlIGVycm9ycz8KCiAgLSBIYXJkd2FyZSBFcnJvcnM6IFVuY29ycmVjdGFibGUgcmVjb3ZlcmFi
bGUgRXJyb3JzOiAKICBhXSB2aXJ0aW8tcG1lbTogCiAgICAtIEFzIHBlciBjdXJyZW50IGxvZ2lj
IGlmIGVycm9yIHBhZ2UgYmVsb25ncyB0byBRZW11IHByb2Nlc3MsIAogICAgICBob3N0IE1DRSBo
YW5kbGVyIGlzb2xhdGVzKGh3cG9pc29uKSB0aGF0IHBhZ2UgYW5kIHNlbmQgU0lHQlVTLiAKICAg
ICAgUWVtdSBTSUdCVVMgaGFuZGxlciBpbmplY3RzIGV4Y2VwdGlvbiB0byBLVk0gZ3Vlc3QuIAog
ICAgLSBLVk0gZ3Vlc3QgdGhlbiBpc29sYXRlcyB0aGUgcGFnZSBhbmQgc2VuZCBTSUdCVVMgdG8g
Z3Vlc3QgCiAgICAgIHVzZXJzcGFjZSBwcm9jZXNzIHdoaWNoIGhhcyBtYXBwZWQgdGhlIHBhZ2Uu
IAogIAogIGJdIEV4aXN0aW5nIGltcGxlbWVudGF0aW9uIGZvciBBQ1BJIHBtZW0gZHJpdmVyOiAK
ICAgIC0gSGFuZGxlcyBzdWNoIGVycm9ycyB3aXRoIE1DRSBub3RpZmllciBhbmQgY3JlYXRlcyBh
IGxpc3QgCiAgICAgIG9mIGJhZCBibG9ja3MuIFJlYWQvZGlyZWN0IGFjY2VzcyBEQVggb3BlcmF0
aW9uIHJldHVybiBFSU8gCiAgICAgIGlmIGFjY2Vzc2VkIG1lbW9yeSBwYWdlIGZhbGwgaW4gYmFk
IGJsb2NrIGxpc3QuCiAgICAtIEl0IGFsc28gc3RhcnRzIGJhY2tnb3VuZCBzY3J1YmJpbmcuICAK
ICAgIC0gU2ltaWxhciBmdW5jdGlvbmFsaXR5IGNhbiBiZSByZXVzZWQgaW4gdmlydGlvLXBtZW0g
d2l0aCBNQ0UgCiAgICAgIG5vdGlmaWVyIGJ1dCB3aXRob3V0IHNjcnViYmluZyhubyBBQ1BJL0FS
Uyk/IE5lZWQgaW5wdXRzIHRvIAogICAgICBjb25maXJtIGlmIHRoaXMgYmVoYXZpb3VyIGlzIG9r
IG9yIG5lZWRzIGFueSBjaGFuZ2U/CgpDaGFuZ2VzIGZyb20gUEFUQ0ggdjEwOiBbMV0gCiAtIFJl
YmFzZWQgb24gTGludXgtNS4yLXJjNAoKQ2hhbmdlcyBmcm9tIFBBVENIIHY5OiBbMl0gCiAtIEtj
b25maWcgaGVscCB0ZXh0IGFkZCB0d28gc3BhY2VzIC0gUmFuZHkKIC0gRml4ZWQgbGlibnZkaW1t
ICdiaW8nIGluY2x1ZGUgd2FybmluZyAtIERhbgogLSB2aXJ0aW8tcG1lbSwgc2VwYXJhdGUgcmVx
dWVzdC9yZXNwIHN0cnVjdCBhbmQgCiAgIG1vdmUgdG8gdWFwaSBmaWxlIHdpdGggdXBkYXRlZCBs
aWNlbnNlIC0gRGF2aWRICiAtIFVzZSB2aXJ0aW8zMiogdHlwZSBmb3IgcmVxL3Jlc3AgZW5kaWFu
ZXNzIC0gRGF2aWRICiAtIEFkZGVkIHRlc3RlZC1ieSAmIGFjay1ieSBvZiBKYWtvYgogLSBSZWJh
c2VkIHRvIDUuMi1yYzEKCkNoYW5nZXMgZnJvbSBQQVRDSCB2ODoKIC0gU2V0IGRldmljZSBtYXBw
ZXIgc3luY2hyb25vdXMgaWYgYWxsIHRhcmdldCBkZXZpY2VzIHN1cHBvcnQgLSBEYW4KIC0gTW92
ZSB2aXJ0aW9fcG1lbS5oIHRvIG52ZGltbSBkaXJlY3RvcnkgIC0gRGFuCiAtIFN0eWxlLCBpbmRl
bnRhdGlvbiAmIGJldHRlciBlcnJvciBtZXNzYWdlcyBpbiBwYXRjaCAyIC0gRGF2aWRICiAtIEFk
ZGVkIE1TVCdzIGFjayBpbiBwYXRjaCAyLgoKQ2hhbmdlcyBmcm9tIFBBVENIIHY3OgogLSBDb3Jy
ZWN0ZWQgcGVuZGluZyByZXF1ZXN0IHF1ZXVlIGxvZ2ljIChwYXRjaCAyKSAtIEpha3ViIFN0YXJv
xYQKIC0gVXNlZCB1bnNpZ25lZCBsb25nIGZsYWdzIGZvciBwYXNzaW5nIERBWERFVl9GX1NZTkMg
KHBhdGNoIDMpIC0gRGFuCiAtIEZpeGVkIHR5cG8gPT4gIHZtYSAnZmxhZycgdG8gJ3ZtX2ZsYWcn
IChwYXRjaCA0KQogLSBBZGRlZCByb2IgaW4gcGF0Y2ggNiAmIHBhdGNoIDIKCkNoYW5nZXMgZnJv
bSBQQVRDSCB2NjogCiAtIENvcnJlY3RlZCBjb21tZW50IGZvcm1hdCBpbiBwYXRjaCA1ICYgcGF0
Y2ggNi4gW0RhdmVdCiAtIENoYW5nZWQgdmFyaWFibGUgZGVjbGFyYXRpb24gaW5kZW50YXRpb24g
aW4gcGF0Y2ggNiBbRGFycmlja10KIC0gQWRkIFJldmlld2VkLWJ5IHRhZyBieSAnSmFuIEthcmEn
IGluIHBhdGNoIDQgJiBwYXRjaCA1CgpDaGFuZ2VzIGZyb20gUEFUQ0ggdjU6IAogIENoYW5nZXMg
c3VnZ2VzdGVkIGluIGJ5IC0gW0Nvcm5lbGlhLCBZdXZhbF0KLSBSZW1vdmUgYXNzaWdubWVudCBj
aGFpbmluZyBpbiB2aXJ0aW8gZHJpdmVyCi0gQmV0dGVyIGVycm9yIG1lc3NhZ2UgYW5kIHJlbW92
ZSBub3QgcmVxdWlyZWQgZnJlZQotIENoZWNrIG5kX3JlZ2lvbiBiZWZvcmUgdXNlCgogIENoYW5n
ZXMgc3VnZ2VzdGVkIGJ5IC0gW0phbiBLYXJhXQotIGRheF9zeW5jaHJvbm91cygpIGZvciAhQ09O
RklHX0RBWAotIENvcnJlY3QgJ2RheGRldl9tYXBwaW5nX3N1cHBvcnRlZCcgY29tbWVudCBhbmQg
bm9uLWRheCBpbXBsZW1lbnRhdGlvbgoKICBDaGFuZ2VzIHN1Z2dlc3RlZCBieSAtIFtEYW4gV2ls
bGlhbXNdCi0gUGFzcyBtZWFuaW5nZnVsIGZsYWcgJ0RBWERFVl9GX1NZTkMnIHRvIGFsbG9jX2Rh
eAotIEdhdGUgbnZkaW1tX2ZsdXNoIGluc3RlYWQgb2YgYWRkaXRpb25hbCBhc3luYyBwYXJhbWV0
ZXIKLSBNb3ZlIGJsb2NrIGNoYWluaW5nIGxvZ2ljIHRvIGZsdXNoIGNhbGxiYWNrIHRoYW4gY29t
bW9uIG52ZGltbV9mbHVzaAotIFVzZSBOVUxMIGZsdXNoIGNhbGxiYWNrIGZvciBnZW5lcmljIGZs
dXNoIGZvciBiZXR0ZXIgcmVhZGFiaWxpdHkgW0RhbiwgSmFuXQoKLSBVc2UgdmlydGlvIGRldmlj
ZSBpZCAyNyBmcm9tIDI1KGFscmVhZHkgdXNlZCkgLSBbTVNUXQoKQ2hhbmdlcyBmcm9tIFBBVENI
IHY0OgotIEZhY3RvciBvdXQgTUFQX1NZTkMgc3VwcG9ydGVkIGZ1bmN0aW9uYWxpdHkgdG8gYSBj
b21tb24gaGVscGVyCgkJCQlbRGF2ZSwgRGFycmljaywgSmFuXQotIENvbW1lbnQsIGluZGVudGF0
aW9uIGFuZCB2aXJ0cXVldWVfa2ljayBmYWlsdXJlIGhhbmRsZSAtIFl1dmFsIFNoYWlhCgpDaGFu
Z2VzIGZyb20gUEFUQ0ggdjM6IAotIFVzZSBnZW5lcmljIGRheF9zeW5jaHJvbm91cygpIGhlbHBl
ciB0byBjaGVjayBmb3IgREFYREVWX1NZTkMgCiAgZmxhZyAtIFtEYW4sIERhcnJpY2ssIEphbl0K
LSBBZGQgJ2lzX252ZGltbV9hc3luYycgZnVuY3Rpb24KLSBEb2N1bWVudCBwYWdlIGNhY2hlIHNp
ZGUgY2hhbm5lbCBhdHRhY2tzIGltcGxpY2F0aW9ucyAmIAogIGNvdW50ZXJtZWFzdXJlcyAtIFtE
YXZlIENoaW5uZXIsIE1pY2hhZWxdCgpDaGFuZ2VzIGZyb20gUEFUQ0ggdjI6IAotIERpc2FibGUg
TUFQX1NZTkMgZm9yIGV4dDQgJiBYRlMgZmlsZXN5c3RlbXMgLSBbRGFuXSAKLSBVc2UgbmFtZSAn
dmlydGlvIHBtZW0nIGluIHBsYWNlIG9mICdmYWtlIGRheCcgCgpDaGFuZ2VzIGZyb20gUEFUQ0gg
djE6IAotIDAtZGF5IGJ1aWxkIHRlc3QgZm9yIGJ1aWxkIGRlcGVuZGVuY3kgb24gbGlibnZkaW1t
IAoKIENoYW5nZXMgc3VnZ2VzdGVkIGJ5IC0gW0RhbiBXaWxsaWFtc10KLSBTcGxpdCB0aGUgZHJp
dmVyIGludG8gdHdvIHBhcnRzIHZpcnRpbyAmIHBtZW0gIAotIE1vdmUgcXVldWluZyBvZiBhc3lu
YyBibG9jayByZXF1ZXN0IHRvIGJsb2NrIGxheWVyCi0gQWRkICJzeW5jIiBwYXJhbWV0ZXIgaW4g
bnZkaW1tX2ZsdXNoIGZ1bmN0aW9uCi0gVXNlIGluZGlyZWN0IGNhbGwgZm9yIG52ZGltbV9mbHVz
aAotIERvbuKAmXQgbW92ZSBkZWNsYXJhdGlvbnMgdG8gY29tbW9uIGdsb2JhbCBoZWFkZXIgZS5n
IG5kLmgKLSBudmRpbW1fZmx1c2goKSByZXR1cm4gMCBvciAtRUlPIGlmIGl0IGZhaWxzCi0gVGVh
Y2ggbnNpb19yd19ieXRlcygpIHRoYXQgdGhlIGZsdXNoIGNhbiBmYWlsCi0gUmVuYW1lIG52ZGlt
bV9mbHVzaCgpIHRvIGdlbmVyaWNfbnZkaW1tX2ZsdXNoKCkKLSBVc2UgJ25kX3JlZ2lvbi0+cHJv
dmlkZXJfZGF0YScgZm9yIGxvbmcgZGVyZWZlcmVuY2luZwotIFJlbW92ZSB2aXJ0aW9fcG1lbV9m
cmVlemUvcmVzdG9yZSBmdW5jdGlvbnMKLSBSZW1vdmUgQlNEIGxpY2Vuc2UgdGV4dCB3aXRoIFNQ
RFggbGljZW5zZSB0ZXh0CgotIEFkZCBtaWdodF9zbGVlcCgpIGluIHZpcnRpb19wbWVtX2ZsdXNo
IC0gW0x1aXpdCi0gTWFrZSBzcGluX2xvY2tfaXJxc2F2ZSgpIG5hcnJvdwoKUGFua2FqIEd1cHRh
ICg3KToKICAgbGlibnZkaW1tOiBuZF9yZWdpb24gZmx1c2ggY2FsbGJhY2sgc3VwcG9ydAogICB2
aXJ0aW8tcG1lbTogQWRkIHZpcnRpby1wbWVtIGd1ZXN0IGRyaXZlcgogICBsaWJudmRpbW06IGFk
ZCBuZF9yZWdpb24gYnVmZmVyZWQgZGF4X2RldiBmbGFnCiAgIGRheDogY2hlY2sgc3luY2hyb25v
dXMgbWFwcGluZyBpcyBzdXBwb3J0ZWQKICAgZG06IGRtOiBFbmFibGUgc3luY2hyb25vdXMgZGF4
CiAgIGV4dDQ6IGRpc2FibGUgbWFwX3N5bmMgZm9yIHZpcnRpbyBwbWVtCiAgIHhmczogZGlzYWJs
ZSBtYXBfc3luYyBmb3IgdmlydGlvIHBtZW0KClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAx
OS81LzIxLzU2OQpbMl0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNS8xNC80NjUKWzNdIGh0
dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2t2bS9tc2cxNDk3NjEuaHRtbApbNF0gaHR0cHM6
Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva3ZtL21zZzE1MzA5NS5odG1sICAKWzVdIGh0dHBzOi8v
bWFyYy5pbmZvLz9sPXFlbXUtZGV2ZWwmbT0xNTU4NjA3NTEyMDIyMDImdz0yCls2XSBodHRwczov
L2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1kZXYvMjAxOTAzL21zZzAwMDgz
Lmh0bWwKWzddIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEvOS8xMTkxCgogZHJpdmVycy9h
Y3BpL25maXQvY29yZS5jICAgICAgICAgfCAgICA0IC0KIGRyaXZlcnMvZGF4L2J1cy5jICAgICAg
ICAgICAgICAgIHwgICAgMiAKIGRyaXZlcnMvZGF4L3N1cGVyLmMgICAgICAgICAgICAgIHwgICAx
OSArKysrKwogZHJpdmVycy9tZC9kbS10YWJsZS5jICAgICAgICAgICAgfCAgIDE0ICsrKysKIGRy
aXZlcnMvbWQvZG0uYyAgICAgICAgICAgICAgICAgIHwgICAgMyAKIGRyaXZlcnMvbnZkaW1tL01h
a2VmaWxlICAgICAgICAgIHwgICAgMSAKIGRyaXZlcnMvbnZkaW1tL2NsYWltLmMgICAgICAgICAg
IHwgICAgNiArCiBkcml2ZXJzL252ZGltbS9uZC5oICAgICAgICAgICAgICB8ICAgIDEgCiBkcml2
ZXJzL252ZGltbS9uZF92aXJ0aW8uYyAgICAgICB8ICAxMjQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL252ZGltbS9wbWVtLmMgICAgICAgICAgICB8ICAg
MTggKysrLS0KIGRyaXZlcnMvbnZkaW1tL3JlZ2lvbl9kZXZzLmMgICAgIHwgICAzMyArKysrKysr
KystCiBkcml2ZXJzL252ZGltbS92aXJ0aW9fcG1lbS5jICAgICB8ICAxMjIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvbnZkaW1tL3ZpcnRpb19wbWVtLmgg
ICAgIHwgICA1NSArKysrKysrKysrKysrKysrKwogZHJpdmVycy92aXJ0aW8vS2NvbmZpZyAgICAg
ICAgICAgfCAgIDExICsrKwogZnMvZXh0NC9maWxlLmMgICAgICAgICAgICAgICAgICAgfCAgIDEw
ICstLQogZnMveGZzL3hmc19maWxlLmMgICAgICAgICAgICAgICAgfCAgICA5ICstCiBpbmNsdWRl
L2xpbnV4L2RheC5oICAgICAgICAgICAgICB8ICAgMjYgKysrKysrKy0KIGluY2x1ZGUvbGludXgv
bGlibnZkaW1tLmggICAgICAgIHwgICAxMCArKy0KIGluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9f
aWRzLmggIHwgICAgMSAKIGluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fcG1lbS5oIHwgICAzNSAr
KysrKysrKysrKwogMjAgZmlsZXMgY2hhbmdlZCwgNDc5IGluc2VydGlvbnMoKyksIDI1IGRlbGV0
aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
